// lib/screens/history/widgets/history_header.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black // Dark mode: màu đen
            : const Color(0xFFF2F9FF), // Light mode: #F2F9FF
        // Đã bỏ boxShadow
      ),
      child: Center(
        child: Text(
          'History',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w700, // w700 (bold)
            color: Theme.of(context).textTheme.headlineMedium?.color, 
          ),
        ),
      ),
    );
  }
}

