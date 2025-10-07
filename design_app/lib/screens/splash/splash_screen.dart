import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splash_viewmodel.dart';
import '../../config/constants.dart';
import '../../widgets/common/progress_bar.dart';
import '../../widgets/common/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashViewModel>().startLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.appSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const Spacer(flex: 3),

              Consumer<SplashViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      Text(
                        '${(viewModel.progress * 100).toInt()}%',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ProgressBar(progress: viewModel.progress),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),
              Text(
                'This section may contain advertising...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
