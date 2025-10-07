// lib/config/routes.dart
import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/language/language_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
        
      case language:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Page Not Found')),
            body: const Center(child: Text('Page not found!')),
          ),
        );
    }
  }
}
