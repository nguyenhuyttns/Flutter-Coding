// lib/screens/chat/widgets/message_input.dart
import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onChanged;
  final bool canSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onChanged,
    required this.canSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor, // Thay Colors.white
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.3) // Dark mode shadow
                : Colors.black.withOpacity(0.05), // Light mode shadow
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800] // Dark mode input background
                    : Colors.grey[100], // Light mode input background
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: controller,
                onChanged: (_) => onChanged(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color, // Text color
                ),
                decoration: InputDecoration(
                  hintText: 'Talk with AI Assistant',
                  hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color, // Hint color
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => canSend ? onSend() : null,
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: canSend ? onSend : null,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: canSend 
                    ? AppColors.primary 
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[600] // Dark mode disabled button
                        : Colors.grey[300], // Light mode disabled button
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send,
                color: canSend 
                    ? Colors.white 
                    : Theme.of(context).iconTheme.color, // Icon color
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
