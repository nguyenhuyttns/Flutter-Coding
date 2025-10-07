// lib/screens/history/widgets/expert_history_list.dart
import 'package:flutter/material.dart';
import '../../../models/chat_history.dart';
import '../../../services/expert_service.dart';

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
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No chat history',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
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
              backgroundColor: Colors.grey[200],
              child:
                  expert != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          expert.imagePath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF4CAF50),
                              child: Text(
                                history.expertName
                                    .substring(0, 1)
                                    .toUpperCase(),
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Colors.grey,
              size: 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Colors.white,
          ),
        );
      },
    );
  }
}
