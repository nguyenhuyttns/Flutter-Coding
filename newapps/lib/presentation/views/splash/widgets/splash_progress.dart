// lib/presentation/views/splash/widgets/splash_progress.dart
import 'package:flutter/material.dart';

class SplashProgress extends StatelessWidget {
  final double progress;
  
  const SplashProgress({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${(progress * 100).toInt()}%',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          minHeight: 6,
        ),
      ],
    );
  }
}
