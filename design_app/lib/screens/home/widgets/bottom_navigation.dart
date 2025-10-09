// lib/screens/home/widgets/bottom_navigation.dart
import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../config/constants.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Giảm height tổng từ 100 xuống 80
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black 
            : Colors.grey[100], 
      ),
      child: Stack(
        children: [
          // Bottom navigation items
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Row(
              children: [
                // Home button
                Expanded(
                  child: _buildNavItem(
                    context: context,
                    icon: Icons.home_outlined, // Tạm dùng icon mặc định
                    label: 'Home',
                    isActive: currentIndex == 0,
                    onTap: () {
                      if (currentIndex != 0) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.home,
                          (route) => false,
                        );
                      }
                    },
                  ),
                ),
                
                // Space for center button
                const SizedBox(width: 80),
                
                // History button
                Expanded(
                  child: _buildNavItem(
                    context: context,
                    icon: Icons.history, // Tạm dùng icon mặc định
                    label: 'History',
                    isActive: currentIndex == 2,
                    onTap: () {
                      if (currentIndex != 2) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.history,
                          (route) => false,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Center floating button
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 2 - 28,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.chat);
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive 
                  ? AppColors.primary 
                  : Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[600],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive 
                    ? AppColors.primary 
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
