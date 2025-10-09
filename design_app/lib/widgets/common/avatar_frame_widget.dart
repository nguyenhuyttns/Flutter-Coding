// lib/widgets/common/avatar_frame_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                      colors:
                          Theme.of(context).brightness == Brightness.dark
                              ? [const Color(0xFF2E3A2E), AppColors.primary]
                              : [const Color(0xFF2E3A2E), AppColors.primary],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),

          if (imagePath != null)
            Positioned(
              top: 5,
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
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[700]
                              : Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Theme.of(
                          context,
                        ).iconTheme.color?.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
            ),

          if (displayName.isNotEmpty)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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
