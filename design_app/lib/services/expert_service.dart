// lib/services/expert_service.dart
import '../models/expert.dart';
import '../config/constants.dart';

class ExpertService {
  static const List<Expert> availableExperts = [
    Expert(
      id: '1',
      name: 'Math',
      imagePath: AppImages.assistant1,
      description: 'Math',
      category: 'Education',
    ),
    Expert(
      id: '2',
      name: 'Physics',
      imagePath: AppImages.assistant2,
      description: 'Physics',
      category: 'Education',
    ),
    Expert(
      id: '3',
      name: 'Chemistry',
      imagePath: AppImages.assistant3,
      description: 'Chemistry',
      category: 'Language',
    ),
    Expert(
      id: '4',
      name: 'History',
      imagePath: AppImages.assistant4,
      description: 'History',
      category: 'Education',
    ),
    Expert(
      id: '5',
      name: 'Languages',
      imagePath: AppImages.assistant5,
      description: 'Languages',
      category: 'Business',
    ),
    Expert(
      id: '6',
      name: 'Finance',
      imagePath: AppImages.assistant6,
      description: 'Finance',
      category: 'Health',
    ),
    Expert(
      id: '7',
      name: 'Coding',
      imagePath: AppImages.assistant7,
      description: 'Coding',
      category: 'Health',
    ),
    Expert(
      id: '8',
      name: 'Garderner',
      imagePath: AppImages.assistant8,
      description: 'Garderner',
      category: 'Health',
    ),
    Expert(
      id: '9',
      name: 'Spirituality',
      imagePath: AppImages.assistant9,
      description: 'Spirituality',
      category: 'Health',
    ),
    Expert(
      id: '10',
      name: 'Content Creator',
      imagePath: AppImages.assistant10,
      description: 'Content Creator',
      category: 'Health',
    ),
  ];

  static List<Expert> getAllExperts() {
    return availableExperts;
  }

  static Expert? getExpertById(String id) {
    try {
      return availableExperts.firstWhere((expert) => expert.id == id);
    } catch (e) {
      return null;
    }
  }
}
