// lib/screens/history/widgets/chichi_history_item.dart
import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class ChiChiHistoryItem extends StatelessWidget {
  final bool hasHistory;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const ChiChiHistoryItem({
    super.key,
    required this.hasHistory,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasHistory) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5), // Thay Colors.grey
            ),
            const SizedBox(height: 16),
            Text(
              'No chat with ChiChi yet',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color, // Thay Colors.grey
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primary,
          child: Text(
            'AI',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          'ChiChi',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).iconTheme.color, // Thay Colors.grey
          size: 24,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Theme.of(context).cardColor, // Thay Colors.white
      ),
    );
  }
}
