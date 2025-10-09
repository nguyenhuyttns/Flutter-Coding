// lib/screens/home/widgets/customization_section.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizationSection extends StatelessWidget {
  final String assistantName;
  final String avatarId;
  final VoidCallback onCustomizeTap;

  const CustomizationSection({
    super.key,
    required this.assistantName,
    required this.avatarId,
    required this.onCustomizeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customize your Assistant',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.headlineMedium?.color,
          ),
        ),

        const SizedBox(height: 16),

        GestureDetector(
          onTap: onCustomizeTap,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,  
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF36B466), 
                  Color(0xFF1EB68B), 
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Group 17.png',
                  width: 50,
                  height: 50,
                  color: Colors.white,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.edit, color: Colors.white, size: 30);
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  'CUSTOMIZATION',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
