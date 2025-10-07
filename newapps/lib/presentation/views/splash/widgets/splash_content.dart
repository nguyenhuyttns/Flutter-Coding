// lib/presentation/views/splash/widgets/splash_content.dart
import 'package:flutter/material.dart';
import 'splash_logo.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SplashLogo(),
        const SizedBox(height: 24),
        const Text(
          'ChiChi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'AI Chat Characters',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
