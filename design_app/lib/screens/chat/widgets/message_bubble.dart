// lib/screens/chat/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import '../../../models/message.dart';
import '../../../widgets/common/feedback_bottom_sheet.dart';
import '../../../config/constants.dart';

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
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primary,
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
                color: isUser 
                    ? AppColors.primary 
                    : Theme.of(context).cardColor, // Thay Colors.white
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.3) // Dark mode shadow
                        : Colors.black.withOpacity(0.05), // Light mode shadow
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: message.isLoading
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.pause,
                          color: Theme.of(context).textTheme.bodyMedium?.color, // Thay Colors.grey
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          message.content,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium?.color, // Thay Colors.grey
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Padding(
                          padding: !isUser
                              ? const EdgeInsets.only(bottom: 24)
                              : EdgeInsets.zero,
                          child: Text(
                            message.content,
                            style: TextStyle(
                              color: isUser 
                                  ? Colors.white 
                                  : Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
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
                                  onTap: () => _showFeedbackBottomSheet(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.grey[700] // Dark mode button background
                                          : Colors.grey[200], // Light mode button background
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.error_outline,
                                      size: 12,
                                      color: Theme.of(context).iconTheme.color, // Theme icon color
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                GestureDetector(
                                  onTap: _onFlagTap,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.grey[700] // Dark mode button background
                                          : Colors.grey[200], // Light mode button background
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.flag_outlined,
                                      size: 12,
                                      color: Theme.of(context).iconTheme.color, // Theme icon color
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
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[600] // Dark mode avatar background
                  : Colors.grey[300], // Light mode avatar background
              child: Icon(
                Icons.person,
                size: 16,
                color: Theme.of(context).iconTheme.color, // Theme icon color
              ),
            ),
          ],
        ],
      ),
    );
  }
}
