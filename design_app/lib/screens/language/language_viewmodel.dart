// lib/screens/language/language_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/language.dart';
import '../../services/storage_service.dart';

class LanguageViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  
  Language _selectedLanguage = Language(
    code: 'en',
    name: 'English',
    countryCode: 'US',
  );
  
  Language get selectedLanguage => _selectedLanguage;
  
  // Danh sách ngôn ngữ có sẵn
  final List<Language> availableLanguages = [
    Language(code: 'hi', name: 'Hindi', countryCode: 'IN'),
    Language(code: 'es', name: 'Spanish', countryCode: 'ES'),
    Language(code: 'fr', name: 'French', countryCode: 'FR'),
    Language(code: 'pt', name: 'Portuguese', countryCode: 'PT'),
    Language(code: 'de', name: 'German', countryCode: 'DE'),
    Language(code: 'ja', name: 'Japanese', countryCode: 'JP'),
    Language(code: 'ko', name: 'Korean', countryCode: 'KR'),
    Language(code: 'en', name: 'English', countryCode: 'GB'),
  ];
  
  // Load ngôn ngữ đã lưu
  Future<void> loadSavedLanguage() async {
    final savedCode = await _storageService.getLanguageCode();
    if (savedCode != null) {
      final language = availableLanguages.firstWhere(
        (lang) => lang.code == savedCode,
        orElse: () => _selectedLanguage,
      );
      _selectedLanguage = language;
      notifyListeners();
    }
  }
  
  // Chọn ngôn ngữ
  void selectLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }
  
  // Lưu và apply ngôn ngữ
  Future<void> saveAndApplyLanguage(BuildContext context) async {
    await _storageService.saveLanguageCode(_selectedLanguage.code);
    
    // TODO: Implement actual language switching in future
    debugPrint('Language saved: ${_selectedLanguage.name}');
    
    // Navigate back
    Navigator.of(context).pop();
  }
}
