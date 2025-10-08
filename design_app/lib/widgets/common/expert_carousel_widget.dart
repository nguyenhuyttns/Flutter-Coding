// lib/widgets/common/expert_carousel_widget.dart
import 'package:flutter/material.dart';
import '../../models/expert.dart';
import '../../config/constants.dart';
import 'avatar_frame_widget.dart';

class ExpertCarouselWidget extends StatelessWidget {
  final List<Expert> experts;
  final PageController pageController;
  final int currentIndex;
  final Function(int) onPageChanged;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final Function(Expert)? onExpertTap;
  final double frameWidth;
  final double frameHeight;

  const ExpertCarouselWidget({
    super.key,
    required this.experts,
    required this.pageController,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onPreviousTap,
    required this.onNextTap,
    this.onExpertTap,
    this.frameWidth = 200,
    this.frameHeight = 280,
  });

  @override
  Widget build(BuildContext context) {
    if (experts.isEmpty) {
      return SizedBox(
        height: frameHeight + 40,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: frameHeight,
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                onPageChanged: onPageChanged,
                itemCount: experts.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: GestureDetector(
                      onTap: onExpertTap != null
                          ? () => onExpertTap!(experts[index])
                          : null,
                      child: AvatarFrameWidget(
                        imagePath: experts[index].imagePath,
                        displayName: experts[index].name,
                        width: frameWidth,
                        height: frameHeight,
                      ),
                    ),
                  );
                },
              ),

              if (currentIndex > 0)
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: onPreviousTap,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black.withOpacity(0.7) // Dark mode navigation button
                              : Colors.black.withOpacity(0.5), // Light mode navigation button
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),

              if (currentIndex < experts.length - 1)
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: onNextTap,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black.withOpacity(0.7) // Dark mode navigation button
                              : Colors.black.withOpacity(0.5), // Light mode navigation button
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            experts.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.primary
                    : Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[600] // Dark mode indicator
                        : Colors.grey[300], // Light mode indicator
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
