// lib/config/constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'ChiChi';
  static const String appSubtitle = 'AI Chat Characters';
  static const Duration splashDuration = Duration(seconds: 3);
}

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryDark = Color(0xFF388E3C);
  
  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Colors.white;
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textSecondaryDark = Color(0xFFBDBDBD);
  
  // Other Colors
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF4CAF50);
}

class AppImages {
  static const String _imagePath = 'assets/images';
  static const String logo = '$_imagePath/logo.png'; 
}
