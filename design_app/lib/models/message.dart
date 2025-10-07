// lib/models/message.dart
enum MessageType { user, bot }

class Message {
  final String id;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isLoading;

  const Message({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
    this.isLoading = false,
  });

  Message copyWith({
    String? id,
    String? content,
    MessageType? type,
    DateTime? timestamp,
    bool? isLoading,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
