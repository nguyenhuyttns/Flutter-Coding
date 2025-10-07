// lib/screens/history/history_viewmodel.dart
import 'package:design_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import '../../models/chat_history.dart';
import '../../models/expert.dart';
import '../../services/expert_service.dart';
import '../../config/routes.dart';

class HistoryViewModel extends ChangeNotifier {
  int _selectedTabIndex = 0;
  List<ChatHistory> _expertHistories = [];
  bool _hasChiChiHistory = false;

  int get selectedTabIndex => _selectedTabIndex;
  List<ChatHistory> get expertHistories => _expertHistories;
  bool get hasChiChiHistory => _hasChiChiHistory;

  void initialize() {
    _loadHistories();
  }

  void _loadHistories() {
    // Mock data - trong thực tế sẽ load từ database/API
    _expertHistories = [
      ChatHistory(
        id: '1',
        expertId: '1',
        expertName: 'Math',
        lastMessage: 'Can you help me solve this equation?',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
        messageCount: 15,
      ),
      ChatHistory(
        id: '2',
        expertId: '2',
        expertName: 'Physics',
        lastMessage: 'What is the speed of light?',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        messageCount: 8,
      ),
    ];

    _hasChiChiHistory = true; // Mock - có history với ChiChi
    notifyListeners();
  }

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void openExpertChat(BuildContext context, String expertId) {
    final expert = ExpertService.getExpertById(expertId);
    if (expert != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => ChatScreen(
                expert: expert,
                showDeleteButton: true, // Show delete button khi vào từ history
              ),
        ),
      );
    }
  }

  void openChiChiChat(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => const ChatScreen(
              showDeleteButton: true, // Show delete button khi vào từ history
            ),
      ),
    );
  }

  void deleteExpertHistory(String historyId) {
    _expertHistories.removeWhere((history) => history.id == historyId);
    notifyListeners();
  }

  void deleteChiChiHistory() {
    _hasChiChiHistory = false;
    notifyListeners();
  }
}
