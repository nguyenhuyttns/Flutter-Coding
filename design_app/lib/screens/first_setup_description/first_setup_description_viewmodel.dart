// lib/screens/first_setup_description/first_setup_description_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/setup_options.dart';
import '../../models/language.dart';
import '../../services/storage_service.dart';
import '../../services/language_service.dart';
import '../../config/routes.dart';

class FirstSetupDescriptionViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  final TextEditingController chatbotRoleController = TextEditingController();
  final TextEditingController expertDetailsController = TextEditingController();

  String? _selectedGender;
  Language? _selectedLanguage;
  String? _selectedResponseStyle;
  String _errorMessage = '';
  bool _isLoading = false;

  String? get selectedGender => _selectedGender;
  Language? get selectedLanguage => _selectedLanguage;
  String? get selectedResponseStyle => _selectedResponseStyle;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  List<GenderOption> get genderOptions => GenderOption.all;
  List<Language> get availableLanguages => LanguageService.availableLanguages;
  List<ResponseStyleOption> get responseStyleOptions => ResponseStyleOption.all;

  Future<void> initialize() async {
    await _loadSavedLanguage();
    await _loadSavedData();
  }

  Future<void> _loadSavedLanguage() async {
    final savedCode = await _storageService.getLanguageCode();
    if (savedCode != null) {
      _selectedLanguage = LanguageService.getLanguageByCode(savedCode);
    } else {
      _selectedLanguage = LanguageService.getDefaultLanguage();
    }
    notifyListeners();
  }

  Future<void> _loadSavedData() async {
    final savedGender = await _storageService.getGender();
    final savedRole = await _storageService.getChatbotRole();
    final savedDetails = await _storageService.getExpertDetails();
    final savedStyle = await _storageService.getResponseStyle();

    if (savedGender != null) _selectedGender = savedGender;
    if (savedRole != null) chatbotRoleController.text = savedRole;
    if (savedDetails != null) expertDetailsController.text = savedDetails;
    if (savedStyle != null) _selectedResponseStyle = savedStyle;

    notifyListeners();
  }

  void selectGender(String? gender) {
    _selectedGender = gender;
    _clearError();
    notifyListeners();
  }

  void selectLanguage(Language? language) {
    _selectedLanguage = language;
    _clearError();
    notifyListeners();
  }

  void selectResponseStyle(String? style) {
    _selectedResponseStyle = style;
    _clearError();
    notifyListeners();
  }

  void onTextChanged() {
    _clearError();
    notifyListeners();
  }

  void _clearError() {
    if (_errorMessage.isNotEmpty) {
      _errorMessage = '';
      notifyListeners();
    }
  }

  bool _validateForm() {
    if (_selectedGender == null) {
      _setError('Please select a gender');
      return false;
    }

    if (_selectedLanguage == null) {
      _setError('Please select a language');
      return false;
    }

    if (chatbotRoleController.text.trim().isEmpty) {
      _setError('Please describe who your chatbot will be');
      return false;
    }

    if (expertDetailsController.text.trim().isEmpty) {
      _setError('Please provide details about your expert');
      return false;
    }

    if (_selectedResponseStyle == null) {
      _setError('Please select a response style');
      return false;
    }

    return true;
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> saveSetup(BuildContext context) async {
    if (!_validateForm()) return;

    _isLoading = true;
    notifyListeners();

    try {
      await Future.wait([
        _storageService.saveGender(_selectedGender!),
        _storageService.saveLanguageCode(_selectedLanguage!.code),
        _storageService.saveChatbotRole(chatbotRoleController.text.trim()),
        _storageService.saveExpertDetails(expertDetailsController.text.trim()),
        _storageService.saveResponseStyle(_selectedResponseStyle!),
      ]);

      debugPrint('Setup description saved successfully');
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    } catch (e) {
      _setError('Failed to save setup. Please try again.');
      debugPrint('Error saving setup description: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    chatbotRoleController.dispose();
    expertDetailsController.dispose();
    super.dispose();
  }
}
