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
      height: 80,
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Home button
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 40),
            child: _buildNavItem(
              context: context,
              imagePath: AppImages.iconhome,
              label: 'Home',
              isActive: currentIndex == 0,
              onTap: () {
                if (currentIndex != 0) {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                }
              },
            ),
          ),

          Transform.translate(
            offset: const Offset(0, -50),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF50C880), 
                shape: BoxShape.circle,
       
              ),
              child: _buildFloatingNavItem(
                imagePath: AppImages.iconmessage,
                isActive: currentIndex == 1,
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.chat);
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 40),
            child: _buildNavItem(
              context: context,
              imagePath: AppImages.iconclock,
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
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String imagePath,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
              AssetImage(imagePath),
              size: 24,
              color:
                  isActive
                      ? AppColors.primary
                      : Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey[600],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color:
                    isActive
                        ? AppColors.primary
                        : Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[400]
                        : Colors.grey[600],
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingNavItem({
    required String imagePath,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: ImageIcon(AssetImage(imagePath), color: Colors.white, size: 28),
      ),
    );
  }
}
