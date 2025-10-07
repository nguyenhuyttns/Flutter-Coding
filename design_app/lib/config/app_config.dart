// lib/config/app_config.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'themes.dart';
import '../screens/splash/splash_viewmodel.dart';
import '../screens/language/language_viewmodel.dart';
import '../screens/intro/intro_viewmodel.dart';
import '../screens/first_setup/first_setup_viewmodel.dart';
import '../screens/first_setup_description/first_setup_description_viewmodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/chat/chat_viewmodel.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
        ChangeNotifierProvider(create: (_) => IntroViewModel()),
        ChangeNotifierProvider(create: (_) => FirstSetupViewModel()),
        ChangeNotifierProvider(create: (_) => FirstSetupDescriptionViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
      ],
      child: MaterialApp(
        title: 'ChiChi - AI Chat Characters',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
