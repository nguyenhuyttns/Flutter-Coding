// lib/screens/chat/chat_viewmodel.dart
import 'package:flutter/material.dart';
import '../../models/message.dart';
import '../../models/expert.dart';

class ChatViewModel extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<Message> _messages = [];
  bool _isLoading = false;
  String _chatTitle = '';
  String _chatSubtitle = '';

  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;
  String get chatTitle => _chatTitle;
  String get chatSubtitle => _chatSubtitle;
  bool get canSend => messageController.text.trim().isNotEmpty && !_isLoading;

  void initializeChat({Expert? expert}) {
    if (expert != null) {
      _chatTitle = expert.name;
      _chatSubtitle = expert.description;
    } else {
      _chatTitle = 'ChiChi';
      _chatSubtitle = 'AI Assistant';
    }

    notifyListeners();
  }

  Future<void> sendMessage() async {
    final messageText = messageController.text.trim();
    if (messageText.isEmpty || _isLoading) return;

    final userMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: messageText,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );

    _messages.add(userMessage);
    messageController.clear();
    _isLoading = true;
    notifyListeners();

    _scrollToBottom();

    final loadingMessage = Message(
      id: 'loading_${DateTime.now().millisecondsSinceEpoch}',
      content: 'Please wait...',
      type: MessageType.bot,
      timestamp: DateTime.now(),
      isLoading: true,
    );
    _messages.add(loadingMessage);
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 3));

      _messages.removeWhere((msg) => msg.id.startsWith('loading_'));

      final botMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: _generateBotResponse(messageText),
        type: MessageType.bot,
        timestamp: DateTime.now(),
      );

      _messages.add(botMessage);
    } catch (e) {
      _messages.removeWhere((msg) => msg.id.startsWith('loading_'));

      final errorMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'Sorry, I encountered an error. Please try again.',
        type: MessageType.bot,
        timestamp: DateTime.now(),
      );
      _messages.add(errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
      _scrollToBottom();
    }
  }

  String _generateBotResponse(String userMessage) {
    final responses = [
      'That\'s an interesting question! Let me help you with that.',
      'I understand what you\'re asking. Here\'s what I think...',
      'Great question! Based on my knowledge...',
      'Let me break this down for you...',
      'That\'s a common concern. Here\'s my advice...',
    ];

    return '${responses[DateTime.now().millisecond % responses.length]} You asked about: "$userMessage"';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void onMessageChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
