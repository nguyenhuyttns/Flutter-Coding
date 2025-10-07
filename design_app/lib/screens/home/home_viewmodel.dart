// lib/screens/home/home_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/expert.dart';
import '../../models/avatar.dart';
import '../../services/expert_service.dart';
import '../../services/storage_service.dart';
import '../../config/routes.dart';
import '../../config/constants.dart';

class HomeViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  final PageController pageController = PageController();

  List<Expert> _experts = [];
  int _currentExpertIndex = 0;
  String _assistantName = '';
  String _selectedAvatarId = '';

  List<Expert> get experts => _experts;
  int get currentExpertIndex => _currentExpertIndex;
  String get assistantName => _assistantName;
  String get selectedAvatarId => _selectedAvatarId;

  Expert? get currentExpert =>
      _experts.isNotEmpty ? _experts[_currentExpertIndex] : null;

  Future<void> initialize() async {
    await _loadExperts();
    await _loadUserData();
  }

  Future<void> _loadExperts() async {
    _experts = ExpertService.getAllExperts();
    notifyListeners();
  }

  Future<void> _loadUserData() async {
    _assistantName = await _storageService.getAssistantName() ?? 'Assistant';
    _selectedAvatarId = await _storageService.getSelectedAvatarId() ?? '1';
    notifyListeners();
  }

  void onExpertPageChanged(int index) {
    _currentExpertIndex = index;
    notifyListeners();
  }

  void nextExpert() {
    if (_currentExpertIndex < _experts.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousExpert() {
    if (_currentExpertIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToCustomization(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.firstSetup);
  }

  void goToChat(BuildContext context, Expert expert) {
    Navigator.of(context).pushNamed(AppRoutes.chat, arguments: expert);
  }

  void goToSettings(BuildContext context) {
    // TODO: Navigate to settings
    debugPrint('Go to settings');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
