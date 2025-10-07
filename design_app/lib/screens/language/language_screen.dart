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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Language'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Consumer<LanguageViewModel>(
            builder: (context, viewModel, child) {
              return IconButton(
                onPressed: () => viewModel.saveAndGoToIntro(context),
                icon: const Icon(Icons.check),
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
