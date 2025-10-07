// lib/models/chat_history.dart
class ChatHistory {
  final String id;
  final String expertId;
  final String expertName;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int messageCount;

  const ChatHistory({
    required this.id,
    required this.expertId,
    required this.expertName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.messageCount,
  });
}
