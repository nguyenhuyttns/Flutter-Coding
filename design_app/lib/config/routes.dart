// lib/config/routes.dart
import 'package:design_app/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/language/language_screen.dart';
import '../screens/intro/intro_screen.dart';
import '../screens/first_setup/first_setup_screen.dart';
import '../screens/first_setup_description/first_setup_description_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/history/history_screen.dart';
import '../models/expert.dart';
import '../screens/permission/permission_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String intro = '/intro';
  static const String firstSetup = '/first-setup';
  static const String firstSetupDescription = '/first-setup-description';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String permission = '/permission';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case chat:
        final expert = routeSettings.arguments as Expert?;
        return MaterialPageRoute(
          builder: (_) => ChatScreen(expert: expert, showDeleteButton: false),
        );
      case history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case permission:
        return MaterialPageRoute(builder: (_) => const PermissionScreen());
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
