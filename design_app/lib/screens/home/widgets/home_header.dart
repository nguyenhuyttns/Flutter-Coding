// lib/screens/home/widgets/home_header.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onSettingsTap;

  const HomeHeader({super.key, required this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black 
            : Color(0xFFF2F9FF), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AI Assistant',
            style: GoogleFonts.roboto(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).textTheme.headlineLarge?.color,
            ),
          ),

          IconButton(
            onPressed: onSettingsTap,
            icon: ImageIcon(
              AssetImage('assets/images/setting.png'),
              size: 26,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
