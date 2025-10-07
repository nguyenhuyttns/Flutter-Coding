// lib/screens/permission/permission_viewmodel.dart
import 'package:flutter/material.dart';

class PermissionViewModel extends ChangeNotifier {
  bool _isAllowAccess = false;

  bool get isAllowAccess => _isAllowAccess;

  Future<void> initialize() async {
    // Initialize permission state if needed
  }

  void toggleAccess(bool value) {
    _isAllowAccess = value;
    notifyListeners();
  }

  void onGetStarted(BuildContext context) {
    // Quay về màn hình settings
    Navigator.of(context).pop();
  }
}
