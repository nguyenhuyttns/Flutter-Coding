// lib/screens/history/widgets/history_tabs.dart
import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class HistoryTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const HistoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800] // Dark mode tab background
            : Colors.grey[200], // Light mode tab background
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedIndex == 0
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Expert List',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedIndex == 0
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyMedium?.color, // Theme color
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selectedIndex == 1
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'ChiChi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: selectedIndex == 1
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyMedium?.color, // Theme color
                    ),
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
