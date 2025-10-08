// lib/services/storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _languageKey = 'selected_language';
  static const String _assistantNameKey = 'assistant_name';
  static const String _selectedAvatarKey = 'selected_avatar_id';
  static const String _genderKey = 'selected_gender';
  static const String _chatbotRoleKey = 'chatbot_role';
  static const String _expertDetailsKey = 'expert_details';
  static const String _responseStyleKey = 'response_style';
  static const String _themeKey = 'theme_mode'; // Thêm key cho theme

  Future<void> saveLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }

  Future<void> saveAssistantName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_assistantNameKey, name);
  }

  Future<String?> getAssistantName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_assistantNameKey);
  }

  Future<void> saveSelectedAvatarId(String avatarId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedAvatarKey, avatarId);
  }

  Future<String?> getSelectedAvatarId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_selectedAvatarKey);
  }

  Future<void> saveGender(String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_genderKey, gender);
  }

  Future<String?> getGender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_genderKey);
  }

  Future<void> saveChatbotRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_chatbotRoleKey, role);
  }

  Future<String?> getChatbotRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_chatbotRoleKey);
  }

  Future<void> saveExpertDetails(String details) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_expertDetailsKey, details);
  }

  Future<String?> getExpertDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_expertDetailsKey);
  }

  Future<void> saveResponseStyle(String style) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_responseStyleKey, style);
  }

  Future<String?> getResponseStyle() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_responseStyleKey);
  }

  // Thêm methods cho theme
  Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }

  Future<void> saveThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeMode);
  }
}
