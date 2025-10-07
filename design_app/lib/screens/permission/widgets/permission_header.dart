// lib/screens/permission/widgets/permission_header.dart
import 'package:flutter/material.dart';

class PermissionHeader extends StatelessWidget {
  const PermissionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
              size: 20,
            ),
          ),
          const Expanded(child: SizedBox()), // Empty space
        ],
      ),
    );
  }
}
