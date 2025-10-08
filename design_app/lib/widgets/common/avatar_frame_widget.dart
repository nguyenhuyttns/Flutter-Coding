// lib/widgets/common/avatar_frame_widget.dart
import 'package:flutter/material.dart';
import '../../config/constants.dart';

class AvatarFrameWidget extends StatelessWidget {
  final String? imagePath;
  final String displayName;
  final double width;
  final double height;

  const AvatarFrameWidget({
    super.key,
    this.imagePath,
    required this.displayName,
    this.width = 200,
    this.height = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.4) // Dark mode shadow
                : Colors.black.withOpacity(0.1), // Light mode shadow
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.avatarFrame,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: Theme.of(context).brightness == Brightness.dark
                          ? [const Color(0xFF2E3A2E), AppColors.primary] // Dark mode gradient
                          : [const Color(0xFF2E3A2E), AppColors.primary], // Light mode gradient (same)
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),

          if (imagePath != null)
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              bottom: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[700] // Dark mode placeholder
                          : Colors.grey[300], // Light mode placeholder
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
            ),

          if (displayName.isNotEmpty)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white, // Giữ màu trắng để contrast với background
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
