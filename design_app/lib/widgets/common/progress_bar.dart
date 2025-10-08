// lib/widgets/common/progress_bar.dart
import 'package:flutter/material.dart';
import '../../config/constants.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color? color;
  final double height;

  const ProgressBar({
    super.key,
    required this.progress,
    this.color,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[700] // Dark mode background
          : Colors.grey[300], // Light mode background
      valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      minHeight: height,
    );
  }
}
