// lib/screens/settings/widgets/settings_list.dart
import 'package:flutter/material.dart';
import '../../../models/settings_item.dart';
import 'settings_list_item.dart';

class SettingsList extends StatelessWidget {
  final List<SettingsItem> items;
  final Function(SettingsItem) onItemTap;

  const SettingsList({super.key, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        separatorBuilder:
            (context, index) => Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.2),
              indent: 60,
            ),
        itemBuilder: (context, index) {
          final item = items[index];
          return SettingsListItem(
            item: item,
            onTap: () => onItemTap(item),
            isFirst: index == 0,
            isLast: index == items.length - 1,
          );
        },
      ),
    );
  }
}
