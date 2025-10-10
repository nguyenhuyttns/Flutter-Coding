// lib/screens/history/widgets/history_tabs.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants.dart';

class HistoryTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final VoidCallback? onChiChiTap; // Thêm callback cho ChiChi

  const HistoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.onChiChiTap, // Optional callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Expert List button
          GestureDetector(
            onTap: () => onTabSelected(0),
            child: Container(
              width: 155,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppColors.primary
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[800] 
                        : Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Expert List',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == 0
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyMedium?.color, 
                  ),
                ),
              ),
            ),
          ),

          // ChiChi button - Direct navigation
          GestureDetector(
            onTap: () {
              if (onChiChiTap != null) {
                onChiChiTap!(); // Trực tiếp gọi navigation
              }
            },
            child: Container(
              width: 155,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Không highlight vì không phải tab
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'ChiChi',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
