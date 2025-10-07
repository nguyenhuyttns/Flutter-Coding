// lib/services/language_service.dart
import '../models/language.dart';

class LanguageService {
  static List<Language> availableLanguages = [
    Language(code: 'hi', name: 'Hindi', countryCode: 'IN'),
    Language(code: 'es', name: 'Spanish', countryCode: 'ES'),
    Language(code: 'fr', name: 'French', countryCode: 'FR'),
    Language(code: 'pt', name: 'Portuguese', countryCode: 'PT'),
    Language(code: 'de', name: 'German', countryCode: 'DE'),
    Language(code: 'ja', name: 'Japanese', countryCode: 'JP'),
    Language(code: 'ko', name: 'Korean', countryCode: 'KR'),
    Language(code: 'en', name: 'English', countryCode: 'GB'),
  ];

  static Language getDefaultLanguage() {
    return Language(code: 'en', name: 'English', countryCode: 'GB');
  }

  static Language? getLanguageByCode(String code) {
    try {
      return availableLanguages.firstWhere((lang) => lang.code == code);
    } catch (e) {
      return null;
    }
  }
}
