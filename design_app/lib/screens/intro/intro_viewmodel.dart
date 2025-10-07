import 'package:flutter/material.dart';
import '../../models/intro_slide.dart';
import '../../config/routes.dart';
import '../../config/constants.dart';

class IntroViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  bool get isLastSlide => _currentIndex == slides.length - 1;

  final List<IntroSlide> slides = [
    IntroSlide(imagePath: AppImages.intro1, title: 'Ask AI Chatbot Anything'),
    IntroSlide(imagePath: AppImages.intro2, title: 'Personalized Assistant'),
    IntroSlide(imagePath: AppImages.intro3, title: 'List of Expert Assistants'),
    IntroSlide(imagePath: AppImages.intro4, title: 'AI Chat History'),
  ];

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextSlide() {
    if (_currentIndex < slides.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToMainApp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    debugPrint('Navigate to home screen');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
