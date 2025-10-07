// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_viewmodel.dart';
import 'widgets/home_header.dart';
import 'widgets/customization_section.dart';
import 'widgets/bottom_navigation.dart';
import '../../widgets/common/expert_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                HomeHeader(
                  onSettingsTap: () => viewModel.goToSettings(context),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chat with Expert',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Center(
                          child: ExpertCarouselWidget(
                            experts: viewModel.experts,
                            pageController: viewModel.pageController,
                            currentIndex: viewModel.currentExpertIndex,
                            onPageChanged: viewModel.onExpertPageChanged,
                            onPreviousTap: viewModel.previousExpert,
                            onNextTap: viewModel.nextExpert,
                            onExpertTap:
                                (expert) => viewModel.goToChat(context, expert),
                            frameWidth: 220,
                            frameHeight: 330,
                          ),
                        ),

                        const SizedBox(height: 30),

                        CustomizationSection(
                          assistantName: viewModel.assistantName,
                          avatarId: viewModel.selectedAvatarId,
                          onCustomizeTap:
                              () => viewModel.goToCustomization(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 0),
    );
  }
}
