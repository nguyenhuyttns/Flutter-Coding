// lib/screens/first_setup/widgets/avatar_grid_widget.dart
import 'package:flutter/material.dart';
import '../../../models/avatar.dart';
import '../../../config/constants.dart';

class AvatarGridWidget extends StatelessWidget {
  final List<Avatar> avatars;
  final Avatar? selectedAvatar;
  final Function(Avatar) onAvatarSelected;

  const AvatarGridWidget({
    super.key,
    required this.avatars,
    required this.selectedAvatar,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          final avatar = avatars[index];
          final isSelected = selectedAvatar?.id == avatar.id;

          return GestureDetector(
            onTap: () => onAvatarSelected(avatar),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey[300]!,
                  width: isSelected ? 3 : 1,
                ),
                boxShadow:
                    isSelected
                        ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.asset(
                  avatar.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
