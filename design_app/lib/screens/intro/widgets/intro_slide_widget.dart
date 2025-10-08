// lib/screens/intro/widgets/intro_slide_widget.dart
import 'package:flutter/material.dart';
import '../../../models/intro_slide.dart';

class IntroSlideWidget extends StatelessWidget {
  final IntroSlide slide;

  const IntroSlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.3) // Dark mode shadow
                        : Colors.black.withOpacity(0.1), // Light mode shadow
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  slide.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800] // Dark mode error container
                          : Colors.grey[300], // Light mode error container
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 64,
                          color: Theme.of(context).iconTheme.color, // Theme icon color
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headlineLarge?.color, // Thay Colors.black87
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
