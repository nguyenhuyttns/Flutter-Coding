import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intro_viewmodel.dart';
import 'widgets/intro_slide_widget.dart';
import 'widgets/intro_bottom_section.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<IntroViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  flex: 7,
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    onPageChanged: viewModel.onPageChanged,
                    itemCount: viewModel.slides.length,
                    itemBuilder: (context, index) {
                      return IntroSlideWidget(slide: viewModel.slides[index]);
                    },
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: IntroBottomSection(
                    currentIndex: viewModel.currentIndex,
                    totalSlides: viewModel.slides.length,
                    isLastSlide: viewModel.isLastSlide,
                    onNext: viewModel.nextSlide,
                    onStart: () => viewModel.goToMainApp(context),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
