// lib/screens/history/widgets/expert_history_list.dart
import 'package:flutter/material.dart';
import '../../../models/chat_history.dart';
import '../../../services/expert_service.dart';
import '../../../config/constants.dart';

class ExpertHistoryList extends StatelessWidget {
  final List<ChatHistory> histories;
  final Function(String historyId, String expertId) onHistoryTap;
  final Function(String historyId) onDeleteTap;

  const ExpertHistoryList({
    super.key,
    required this.histories,
    required this.onHistoryTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    if (histories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5), // Thay Colors.grey
            ),
            const SizedBox(height: 16),
            Text(
              'No chat history',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color, // Thay Colors.grey
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: histories.length,
      itemBuilder: (context, index) {
        final history = histories[index];
        final expert = ExpertService.getExpertById(history.expertId);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            onTap: () => onHistoryTap(history.id, history.expertId),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[700] // Dark mode avatar background
                  : Colors.grey[200], // Light mode avatar background
              child: expert != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        expert.imagePath,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.primary,
                            child: Text(
                              history.expertName.substring(0, 1).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Text(
                      history.expertName.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
            ),
            title: Text(
              history.expertName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
              ),
            ),
            trailing: Icon(
              Icons.arrow_right_outlined,
              color: Theme.of(context).iconTheme.color, // Thay Colors.grey
              size: 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Theme.of(context).cardColor, // Thay Colors.white
          ),
        );
      },
    );
  }
}
