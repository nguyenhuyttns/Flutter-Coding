// lib/screens/chat/widgets/message_input.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onChanged;
  final bool canSend;
  final EdgeInsets containerPadding;
  final EdgeInsets textFieldMargin;
  final EdgeInsets iconMargin;
  final double itemSpacing;
  final double textFieldWidth;
  final double textFieldHeight;
  final double textFieldBorderRadius;
  final EdgeInsets textFieldContentPadding;
  final double iconSize;
  final double iconContainerSize;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onChanged,
    required this.canSend,
    this.containerPadding = const EdgeInsets.all(20),
    this.textFieldMargin = const EdgeInsets.only(left: 10), 
    this.iconMargin = const EdgeInsets.only(right: 20),
    this.itemSpacing = 15,
    this.textFieldWidth = 250, 
    this.textFieldHeight = 47,
    this.textFieldBorderRadius = 12,
    this.textFieldContentPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.iconSize = 55,
    this.iconContainerSize = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F9FF),
      ),
      child: Row(
        children: [
          Container(
            margin: textFieldMargin, // TextField sẽ lui vào trái 40px
            width: textFieldWidth,
            height: textFieldHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(textFieldBorderRadius),
              border: Border.all(
                color: const Color(0xFF8F9DAA),
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller,
              onChanged: (_) => onChanged(),
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                hintText: 'Talk with AI Assistant',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: textFieldContentPadding,
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => canSend ? onSend() : null,
            ),
          ),

          SizedBox(width: itemSpacing),

          Container(
            margin: iconMargin, // Icon sẽ lui vào phải 30px
            child: GestureDetector(
              onTap: canSend ? onSend : null,
              child: Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F9FF),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImages.iconsend,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
