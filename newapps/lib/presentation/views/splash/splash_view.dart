// lib/presentation/views/splash/splash_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/splash_viewmodel.dart';
import 'widgets/splash_progress.dart';
import 'widgets/splash_content.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<SplashViewModel>();
      viewModel.setContext(context);
      viewModel.startLoading();
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
              const SplashContent(),
              const Spacer(flex: 3),
              Consumer<SplashViewModel>(
                builder: (context, viewModel, child) {
                  return SplashProgress(progress: viewModel.progress);
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
