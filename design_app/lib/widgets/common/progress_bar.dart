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
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
      minHeight: height,
    );
  }
}
