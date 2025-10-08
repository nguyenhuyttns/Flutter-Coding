// lib/screens/language/widgets/language_item.dart
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import '../../../models/language.dart';
import '../../../config/constants.dart';

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
              ? AppColors.primary 
              : Theme.of(context).cardColor, // Thay Colors.white
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
                ? AppColors.primary 
                : isDarkMode 
                    ? Colors.grey[600]! // Dark mode border
                    : Colors.grey[300]!, // Light mode border
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 24,
              child: CountryFlag.fromCountryCode(
                language.countryCode,
                shape: const RoundedRectangle(4),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                language.name,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected 
                      ? Colors.white 
                      : Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),

            if (isSelected)
              const Icon(Icons.check, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
