// lib/screens/language/language_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_viewmodel.dart';
import 'widgets/language_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LanguageViewModel>().loadSavedLanguage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Thay Colors.grey[50]
      appBar: AppBar(
        title: Text(
          'Language',
          style: Theme.of(context).textTheme.headlineMedium, // Sử dụng theme text style
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Thay Colors.white
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor, // Thay Colors.black
        elevation: 0,
        iconTheme: Theme.of(context).appBarTheme.iconTheme, // Sử dụng theme icon
        actions: [
          Consumer<LanguageViewModel>(
            builder: (context, viewModel, child) {
              return IconButton(
                onPressed: () => viewModel.saveAndGoToIntro(context),
                icon: Icon(
                  Icons.check,
                  color: Theme.of(context).iconTheme.color, // Sử dụng theme icon color
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<LanguageViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: viewModel.availableLanguages.length,
            itemBuilder: (context, index) {
              final language = viewModel.availableLanguages[index];
              final isSelected = language == viewModel.selectedLanguage;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: LanguageItem(
                  language: language,
                  isSelected: isSelected,
                  onTap: () => viewModel.selectLanguage(language),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
