// lib/widgets/common/avatar_grid_widget.dart
import 'package:flutter/material.dart';
import '../../models/avatar.dart';
import '../../config/constants.dart';

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
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          final avatar = avatars[index];
          final isSelected = selectedAvatar?.id == avatar.id;

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onAvatarSelected(avatar),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected 
                        ? AppColors.primary 
                        : Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[600]! // Dark mode border
                            : Colors.grey[300]!, // Light mode border
                    width: isSelected ? 3 : 1,
                  ),
                  boxShadow: isSelected
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[700] // Dark mode placeholder
                            : Colors.grey[300], // Light mode placeholder
                        child: Icon(
                          Icons.person,
                          size: 32,
                          color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
