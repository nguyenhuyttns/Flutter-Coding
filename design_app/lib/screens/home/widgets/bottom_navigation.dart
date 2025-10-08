// lib/screens/home/widgets/bottom_navigation.dart
import 'package:flutter/material.dart';
import '../../../config/routes.dart';
import '../../../config/constants.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).bottomNavigationBarTheme.backgroundColor, // Thay Colors.white
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.3) // Dark mode shadow
                        : Colors.black.withOpacity(0.1), // Light mode shadow
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildNavItem(
                    context: context,
                    icon: Icons.home_outlined,
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

                  const SizedBox(width: 56),

                  _buildNavItem(
                    context: context,
                    icon: Icons.history,
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
                ],
              ),
            ),
          ),

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
                  color: AppColors.primary, // Sử dụng AppColors.primary
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                  size: 28,
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive 
                  ? AppColors.primary 
                  : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, // Theme color
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: isActive 
                    ? AppColors.primary 
                    : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor, // Theme color
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
