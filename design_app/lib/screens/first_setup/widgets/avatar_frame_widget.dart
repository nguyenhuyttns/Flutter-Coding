// lib/screens/first_setup/widgets/avatar_frame_widget.dart
import 'package:flutter/material.dart';
import '../../../models/avatar.dart';
import '../../../config/constants.dart';

class AvatarFrameWidget extends StatelessWidget {
  final Avatar? selectedAvatar;
  final String assistantName;

  const AvatarFrameWidget({
    super.key,
    this.selectedAvatar,
    required this.assistantName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 280,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImages.avatarFrame,
              width: 200,
              height: 280,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF2E3A2E), Color(0xFF4CAF50)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),

          if (selectedAvatar != null)
            Positioned(
              top: 15,
              left: 10,
              right: 10,
              bottom: 45,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  selectedAvatar!.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 64,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

          if (assistantName.isNotEmpty)
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  assistantName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
