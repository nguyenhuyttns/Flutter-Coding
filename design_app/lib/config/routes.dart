// lib/config/routes.dart
import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/language/language_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/first_setup/first_setup_screen.dart';
import '../screens/first_setup_description/first_setup_description_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String intro = '/intro';
  static const String firstSetup = '/first-setup';
  static const String firstSetupDescription = '/first-setup-description';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case language:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());

      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

      case firstSetup:
        return MaterialPageRoute(builder: (_) => const FirstSetupScreen());

      case firstSetupDescription:
        return MaterialPageRoute(
          builder: (_) => const FirstSetupDescriptionScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text('Page Not Found')),
                body: const Center(child: Text('Page not found!')),
              ),
        );
    }
  }
}
