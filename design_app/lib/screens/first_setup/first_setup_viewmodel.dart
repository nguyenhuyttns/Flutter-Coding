// lib/screens/first_setup/first_setup_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/avatar.dart';
import '../../config/constants.dart';
import '../../config/routes.dart';
import '../../services/storage_service.dart';

class FirstSetupViewModel extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  final TextEditingController nameController = TextEditingController();

  Avatar? _selectedAvatar;
  String _errorMessage = '';
  bool _isLoading = false;

  Avatar? get selectedAvatar => _selectedAvatar;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  String get assistantName => nameController.text.trim();

  final List<Avatar> availableAvatars = [
    Avatar(id: '1', imagePath: AppImages.avatar1, name: 'Avatar 1'),
    Avatar(id: '2', imagePath: AppImages.avatar2, name: 'Avatar 2'),
    Avatar(id: '3', imagePath: AppImages.avatar3, name: 'Avatar 3'),
    Avatar(id: '4', imagePath: AppImages.avatar4, name: 'Avatar 4'),
    Avatar(id: '5', imagePath: AppImages.avatar5, name: 'Avatar 5'),
    Avatar(id: '6', imagePath: AppImages.avatar6, name: 'Avatar 6'),
    Avatar(id: '7', imagePath: AppImages.avatar7, name: 'Avatar 7'),
    Avatar(id: '8', imagePath: AppImages.avatar8, name: 'Avatar 8'),
    Avatar(id: '9', imagePath: AppImages.avatar9, name: 'Avatar 9'),
    Avatar(id: '10', imagePath: AppImages.avatar10, name: 'Avatar 10'),
    Avatar(id: '11', imagePath: AppImages.avatar11, name: 'Avatar 11'),
    Avatar(id: '12', imagePath: AppImages.avatar12, name: 'Avatar 12'),
  ];

  void selectAvatar(Avatar avatar) {
    _selectedAvatar = avatar;
    clearError();
    notifyListeners();
  }

  void onNameChanged() {
    clearError();
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  bool _validateForm() {
    if (nameController.text.trim().isEmpty) {
      _errorMessage = 'Please enter assistant name';
      notifyListeners();
      return false;
    }

    if (_selectedAvatar == null) {
      _errorMessage = 'Please choose an avatar';
      notifyListeners();
      return false;
    }

    return true;
  }

  Future<void> saveAndContinue(BuildContext context) async {
    if (!_validateForm()) return;

    _isLoading = true;
    notifyListeners();

    try {
      await _storageService.saveAssistantName(nameController.text.trim());
      await _storageService.saveSelectedAvatarId(_selectedAvatar!.id);

      debugPrint(
        'Assistant setup saved: ${nameController.text}, Avatar: ${_selectedAvatar!.id}',
      );

      Navigator.of(
        context,
      ).pushReplacementNamed(AppRoutes.firstSetupDescription);
    } catch (e) {
      _errorMessage = 'Failed to save setup. Please try again.';
      debugPrint('Error saving setup: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
