// lib/presentation/viewmodels/splash_viewmodel.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../app/routes/app_routes.dart';

class SplashViewModel extends ChangeNotifier {
  double _progress = 0.0;
  Timer? _timer;
  BuildContext? _context;
  
  double get progress => _progress;
  
  void setContext(BuildContext context) {
    _context = context;
  }
  
  void startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_progress >= 1.0) {
        _timer?.cancel();
        _navigateToHome();
      } else {
        _progress += 0.02; // Tăng 2% mỗi 50ms
        notifyListeners();
      }
    });
  }
  
  void _navigateToHome() {
    if (_context != null) {
      // TODO: Thay AppRoutes.home khi có màn hình home
      Navigator.of(_context!).pushReplacementNamed(AppRoutes.splash);
      debugPrint('Navigate to home screen');
    }
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
