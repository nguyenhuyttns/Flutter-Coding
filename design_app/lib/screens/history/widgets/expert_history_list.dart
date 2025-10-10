// lib/screens/history/widgets/expert_history_list.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5), 
            ),
            const SizedBox(height: 16),
            Text(
              'No chat history',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color, 
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
          width: 324, 
          height: 78, // Chiều cao cố định
          decoration: BoxDecoration(
            color: const Color(0xFFD5DEE5), // Màu #D5DEE5
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => onHistoryTap(history.id, history.expertId),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[200],
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
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Text(
                            history.expertName.substring(0, 1).toUpperCase(),
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Expert name
                  Expanded(
                    child: Text(
                      history.expertName,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black, 
                      ),
                    ),
                  ),
                  
                  // Next icon
                  ImageIcon(
                    AssetImage(AppImages.iconnext),
                    color: Colors.black, 
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
