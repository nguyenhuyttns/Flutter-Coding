// lib/app/routes/route_generator.dart
import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../../presentation/views/splash/splash_view.dart';
// Import các view khác khi tạo

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
        
      // case AppRoutes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeView(),
      //     settings: settings,
      //   );
        
      default:
        return _errorRoute(settings.name ?? 'Unknown');
    }
  }
  
  static Route<dynamic> _errorRoute(String routeName) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(  // Thay _ thành context
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text('Route "$routeName" not found'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.splash), // Thay _ thành context
                child: const Text('Go to Splash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
