// lib/screens/language/widgets/language_item.dart
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/language.dart';


class LanguageItem extends StatelessWidget {
  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageItem({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFF50C880) // Màu xanh khi selected
              : Theme.of(context).cardColor, 
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF50C880), // Viền luôn màu #50C880
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32, // Thay đổi height để làm hình vuông
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Hình tròn
              ),
              clipBehavior: Clip.hardEdge, // Clip flag theo hình tròn
              child: CountryFlag.fromCountryCode(
                language.countryCode,
                shape: const RoundedRectangle(4),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                language.name,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400, // w400 (normal)
                  color: isSelected 
                      ? Colors.white // Text trắng khi selected
                      : Theme.of(context).textTheme.bodyLarge?.color, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
