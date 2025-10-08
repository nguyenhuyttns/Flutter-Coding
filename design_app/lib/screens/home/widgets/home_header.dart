// lib/screens/home/widgets/home_header.dart
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onSettingsTap;

  const HomeHeader({super.key, required this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor, // Thay Colors.white
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withOpacity(0.2) // Dark mode shadow
                : Colors.black.withOpacity(0.05), // Light mode shadow
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AI Assistant',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.headlineLarge?.color, // Thay Colors.black87
            ),
          ),

          IconButton(
            onPressed: onSettingsTap,
            icon: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).iconTheme.color, // Thay Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
