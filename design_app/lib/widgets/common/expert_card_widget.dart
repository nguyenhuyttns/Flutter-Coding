// lib/widgets/common/expert_card_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertCardWidget extends StatelessWidget {
  final String imagePath;
  final String displayName;
  final double width;
  final double height;

  const ExpertCardWidget({
    super.key,
    required this.imagePath,
    required this.displayName,
    this.width = 200,
    this.height = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Ảnh expert full size
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[700]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 64,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                  ),
                );
              },
            ),
          ),
          
       
          Positioned(
            bottom: 15, 
            left: 0,
            right: 0,
            child: Text(
              displayName,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
