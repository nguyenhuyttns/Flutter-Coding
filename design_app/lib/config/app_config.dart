// lib/config/app_config.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'themes.dart';
import '../screens/splash/splash_viewmodel.dart';
import '../screens/language/language_viewmodel.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
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
