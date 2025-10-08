// lib/screens/first_setup_description/widgets/custom_dropdown.dart
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor, // Thay Colors.white
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[600]! // Dark mode border
                  : Colors.grey[300]!, // Light mode border
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: Text(
                'Select $label',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color, // Theme hint color
                ),
              ),
              isExpanded: true,
              items: items,
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).iconTheme.color, // Theme icon color
              ),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color, // Theme text color
                fontSize: 16,
              ),
              dropdownColor: Theme.of(context).cardColor, // Dropdown background
            ),
          ),
        ),
      ],
    );
  }
}
