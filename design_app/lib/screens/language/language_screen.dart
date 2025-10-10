// lib/screens/language/language_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black // Dark mode: màu đen
          : const Color(0xFFF2F9FF), // Light mode: #F2F9FF
      appBar: AppBar(
        title: Text(
          'Language',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w800, // w800 (extra bold)
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white // Dark mode: text trắng
                : Colors.black, // Light mode: text đen
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black // Dark mode: AppBar đen
            : const Color(0xFFF2F9FF), // Light mode: AppBar #F2F9FF
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white // Dark mode: foreground trắng
            : Colors.black, // Light mode: foreground đen
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white // Dark mode: icon trắng
              : Colors.black, // Light mode: icon đen
        ),
        centerTitle: false, // Căn bên trái
        actions: [
          Consumer<LanguageViewModel>(
            builder: (context, viewModel, child) {
              return IconButton(
                onPressed: () => viewModel.saveAndGoToIntro(context),
                icon: Icon(
                  Icons.check,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white // Dark mode: icon trắng
                      : Colors.black, // Light mode: icon đen
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
