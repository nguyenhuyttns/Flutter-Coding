// lib/screens/chat/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import '../../../models/message.dart';
import '../../../widgets/common/feedback_bottom_sheet.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isLastMessage;

  const MessageBubble({
    super.key,
    required this.message,
    this.isLastMessage = false,
  });

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FeedbackBottomSheet(),
    );
  }

  void _onFlagTap() {
    print('Flag tapped');
  }

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;

    return Container(
      margin: EdgeInsets.only(
        bottom: isLastMessage ? 16 : 8,
        left: isUser ? 48 : 0,
        right: isUser ? 0 : 48,
      ),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF4CAF50),
              child: const Text(
                'AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? const Color(0xFF4CAF50) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child:
                  message.isLoading
                      ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.pause, color: Colors.grey, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            message.content,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                      : Stack(
                        children: [
                          Padding(
                            padding:
                                !isUser
                                    ? const EdgeInsets.only(bottom: 24)
                                    : EdgeInsets.zero,
                            child: Text(
                              message.content,
                              style: TextStyle(
                                color: isUser ? Colors.white : Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          if (!isUser)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap:
                                        () => _showFeedbackBottomSheet(context),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.error_outline,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  GestureDetector(
                                    onTap: _onFlagTap,
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.flag_outlined,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
            ),
          ),

          if (isUser) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 16, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }
}
