// lib/screens/chat/widgets/chat_app_bar.dart
import 'package:flutter/material.dart';
import '../../../widgets/common/feedback_bottom_sheet.dart';

class ChatAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackPressed;

  const ChatAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBackPressed,
  });

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FeedbackBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          Expanded(
            child: Text(
              '$title Assistant',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          IconButton(
            onPressed: () => _showFeedbackBottomSheet(context),
            icon: const Icon(Icons.inbox, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
