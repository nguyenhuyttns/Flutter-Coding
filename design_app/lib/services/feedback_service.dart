// lib/services/feedback_service.dart
class FeedbackService {
  static Future<bool> sendFeedback({
    required String subject,
    required String feedback,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return true;
    } catch (e) {
      return false;
    }
  }
}
