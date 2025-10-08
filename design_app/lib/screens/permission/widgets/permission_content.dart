// lib/screens/permission/widgets/permission_content.dart
import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class PermissionContent extends StatelessWidget {
  final bool isAllowAccess;
  final Function(bool) onToggleAccess;
  final VoidCallback onGetStarted;

  const PermissionContent({
    super.key,
    required this.isAllowAccess,
    required this.onToggleAccess,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),

          // Permission title
          const Text(
            'Permission',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary, // Giữ màu primary
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            'It\'s important!',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color, // Thay Colors.grey
              fontWeight: FontWeight.w400,
            ),
          ),

          const Spacer(flex: 3),

          // Allow access row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, // Thay Colors.white
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black.withOpacity(0.3) // Dark mode shadow
                      : Colors.grey.withOpacity(0.1), // Light mode shadow
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allow access',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
                  ),
                ),
                Switch(
                  value: isAllowAccess,
                  onChanged: onToggleAccess,
                  activeColor: AppColors.primary, // Sử dụng AppColors.primary
                  activeTrackColor: AppColors.primary.withOpacity(0.3),
                  inactiveThumbColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[600] // Dark mode inactive thumb
                      : Colors.grey, // Light mode inactive thumb
                  inactiveTrackColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[600]?.withOpacity(0.3) // Dark mode inactive track
                      : Colors.grey.withOpacity(0.3), // Light mode inactive track
                ),
              ],
            ),
          ),

          const Spacer(flex: 2),

          // Get started button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
