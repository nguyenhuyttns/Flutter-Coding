// lib/screens/splash/splash_viewmodel.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../config/routes.dart';
import '../../config/constants.dart';

class SplashViewModel extends ChangeNotifier {
  double _progress = 0.0;
  Timer? _timer;
  
  double get progress => _progress;
  
  void startLoading(BuildContext context) {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_progress >= 1.0) {
        _timer?.cancel();
        _navigateToNext(context);
      } else {
        _progress += 0.02; // Tăng 2% mỗi 50ms
        notifyListeners();
      }
    });
  }
  
  void _navigateToNext(BuildContext context) {
  Navigator.of(context).pushReplacementNamed(AppRoutes.language);
  debugPrint('Navigate to language screen');
  }

  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
