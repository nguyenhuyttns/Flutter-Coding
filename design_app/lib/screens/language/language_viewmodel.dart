// lib/screens/language/language_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/language.dart';
import '../../services/storage_service.dart';
import '../../services/language_service.dart';
import '../../config/routes.dart';

class LanguageViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();

  Language _selectedLanguage = LanguageService.getDefaultLanguage();

  Language get selectedLanguage => _selectedLanguage;
  List<Language> get availableLanguages => LanguageService.availableLanguages;

  Future<void> loadSavedLanguage() async {
    final savedCode = await _storageService.getLanguageCode();
    if (savedCode != null) {
      final language = LanguageService.getLanguageByCode(savedCode);
      if (language != null) {
        _selectedLanguage = language;
        notifyListeners();
      }
    }
  }

  void selectLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  Future<void> saveAndGoToIntro(BuildContext context) async {
    await _storageService.saveLanguageCode(_selectedLanguage.code);
    debugPrint('Language saved: ${_selectedLanguage.name}');
    Navigator.of(context).pushReplacementNamed(AppRoutes.intro);
  }
}
