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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Flag icon - sử dụng syntax đúng của country_flags
            SizedBox(
              width: 32,
              height: 24,
              child: CountryFlag.fromCountryCode(
                language.countryCode,
                shape: const RoundedRectangle(4),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Language name
            Expanded(
              child: Text(
                language.name,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
            
            // Check icon for selected item
            if (isSelected)
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
