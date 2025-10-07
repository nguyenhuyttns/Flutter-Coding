// lib/screens/intro/widgets/intro_bottom_section.dart
import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class IntroBottomSection extends StatelessWidget {
  final int currentIndex;
  final int totalSlides;
  final bool isLastSlide;
  final VoidCallback onNext;
  final VoidCallback onStart;

  const IntroBottomSection({
    super.key,
    required this.currentIndex,
    required this.totalSlides,
    required this.isLastSlide,
    required this.onNext,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              totalSlides,
              (index) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: currentIndex == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index
                          ? AppColors.primary
                          : Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: isLastSlide ? onStart : onNext,
            child: Text(
              isLastSlide ? 'Start' : 'Next',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.backgroundDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
