// lib/screens/settings/settings_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/settings_item.dart';
import '../../config/routes.dart';
import 'widgets/rating_dialog.dart';

class SettingsViewModel extends ChangeNotifier {
  List<SettingsItem> _settingsItems = [];

  List<SettingsItem> get settingsItems => _settingsItems;

  Future<void> initialize() async {
    await _loadSettingsItems();
  }

  Future<void> _loadSettingsItems() async {
    _settingsItems = [
      SettingsItem(id: 'rating', title: 'Rating', icon: Icons.star_outline),
      SettingsItem(id: 'language', title: 'Language', icon: Icons.language),
      SettingsItem(
        id: 'feedback',
        title: 'Feedback',
        icon: Icons.feedback_outlined,
      ),
      SettingsItem(id: 'share', title: 'Share', icon: Icons.share_outlined),
      SettingsItem(
        id: 'privacy_policy',
        title: 'Privacy Policy',
        icon: Icons.privacy_tip_outlined,
      ),
    ];
    notifyListeners();
  }

  void onSettingItemTap(BuildContext context, SettingsItem item) {
    switch (item.id) {
      case 'rating':
        _showRatingDialog(context);
        break;
      case 'language':
        _goToLanguageScreen(context);
        break;
      case 'feedback':
        debugPrint('Tapped on: ${item.title}');
        break;
      case 'share':
        debugPrint('Tapped on: ${item.title}');
        break;
      case 'privacy_policy':
        _goToPermissionScreen(context);
        break;
      default:
        debugPrint('Tapped on: ${item.title}');
    }
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const RatingDialog(),
    );
  }

  void _goToLanguageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.language);
  }

  void _goToPermissionScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.permission);
  }
}
