// lib/screens/chat/widgets/chat_app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/common/feedback_bottom_sheet.dart';
import '../../../config/constants.dart';

class ChatAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackPressed;
  final VoidCallback? onDeletePressed;
  final bool showDeleteButton;

  const ChatAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBackPressed,
    this.onDeletePressed,
    this.showDeleteButton = false,
  });

  void _showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FeedbackBottomSheet(),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to delete this chat history?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: const Color(0xFF898989), // Màu #898989
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              Row(
                children: [
                  // Cancel button
                  Expanded(
                    child: SizedBox(
                      height: 48, // Cố định chiều cao
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).dialogTheme.backgroundColor,
                          side: const BorderSide(
                            color: Color(0xFF50C880), // Viền màu #50C880
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Bo nhẹ 4 góc
                          ),
                          padding: EdgeInsets.zero, // Bỏ padding mặc định
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF50C880), // Text màu #50C880
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Delete button
                  Expanded(
                    child: SizedBox(
                      height: 48, // Cố định chiều cao
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onDeletePressed?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Bo nhẹ 4 góc
                          ),
                          elevation: 0,
                          padding: EdgeInsets.zero, // Bỏ padding mặc định
                        ),
                        child: Text(
                          'Delete',
                          style: GoogleFonts.roboto(
                            color: Colors.white, // Màu trắng
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black // Dark mode: màu đen
            : const Color(0xFFF2F9FF), // Light mode: #F2F9FF
        // Đã xóa hết boxShadow
      ),
      child: Row(
        children: [
          // Back button with custom icon
          IconButton(
            onPressed: onBackPressed,
            icon: ImageIcon(
              AssetImage(AppImages.iconback),
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white // Dark mode: icon trắng
                  : Colors.black, // Light mode: icon đen
              size: 24,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          // Title
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w700, // w700 (bold)
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white // Dark mode: text trắng
                    : Colors.black, // Light mode: text đen
              ),
            ),
          ),

          // Mail/Delete button
          IconButton(
            onPressed: showDeleteButton
                ? () => _showDeleteConfirmation(context)
                : () => _showFeedbackBottomSheet(context),
            icon: ImageIcon(
              AssetImage(showDeleteButton 
                  ? AppImages.iconbin 
                  : AppImages.iconmail), 
              color: showDeleteButton
                  ? Colors.black 
                  : Theme.of(context).brightness == Brightness.dark
                      ? Colors.white 
                      : Colors.black, 
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
