// lib/screens/chat/widgets/message_input.dart
import 'package:flutter/material.dart';

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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: controller,
                onChanged: (_) => onChanged(),
                decoration: const InputDecoration(
                  hintText: 'Talk with AI Assistant',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
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
                color: canSend ? const Color(0xFF4CAF50) : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send,
                color: canSend ? Colors.white : Colors.grey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
