// lib/services/expert_service.dart
import '../models/expert.dart';
import '../config/constants.dart';

class ExpertService {
  static const List<Expert> availableExperts = [
    Expert(
      id: '1',
      name: 'Math',
      imagePath: AppImages.expert1,
    ),
    Expert(
      id: '2',
      name: 'Physics',
      imagePath: AppImages.expert2,
    ),
    Expert(
      id: '3',
      name: 'Chemistry',
      imagePath: AppImages.expert3,
    ),
    Expert(
      id: '4',
      name: 'History',
      imagePath: AppImages.expert4,
    ),
    Expert(
      id: '5',
      name: 'Languages',
      imagePath: AppImages.expert5,
    ),
    Expert(
      id: '6',
      name: 'Finance',
      imagePath: AppImages.expert6,
    ),
    Expert(
      id: '7',
      name: 'Coding',
      imagePath: AppImages.expert7,
    ),
    Expert(
      id: '8',
      name: 'Garderner',
      imagePath: AppImages.expert8,
    ),
    Expert(
      id: '9',
      name: 'Spirituality',
      imagePath: AppImages.expert9,
    ),
    Expert(
      id: '10',
      name: 'Content Creator',
      imagePath: AppImages.expert10,
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
