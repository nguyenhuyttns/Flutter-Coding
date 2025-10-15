import 'package:flutter/material.dart';
import 'package:apps/mock_data_project.dart';
import 'package:apps/widgets/delete_project_popup.dart';

class ProjectItemCard extends StatelessWidget {
  const ProjectItemCard({super.key, required this.item});

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    final Color baseColor = item.isError
        ? const Color(0xFFFFA29F)
        : const Color(0xFFFFC9A1);
    final Color accentColor = item.isError
        ? const Color(0xFFFF5A58)
        : const Color(0xFFFF8A34);
    final Color progressColor = item.isError
        ? const Color(0xFFFF8A34)
        : const Color(0xFFFFB067);

    return Container(
      width: 328,
      height: 144,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentColor, width: 1.5),
      ),
      child: Column(
        children: [
          // Top section with image and content
          Expanded(
            child: Row(
              children: [
                // Left - Image centered vertically
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://picsum.photos/56/56?random=${item.title.hashCode}',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Right - Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F1F1F),
                              ),
                            ),
                          ),
                          if (item.isError)
                            GestureDetector(
                              onTap: () async {
                                final result = await DeleteProjectPopup.show(context);
                                if (result == true) {
                                  // Handle delete action here
                                  // You can add a callback to parent widget
                                }
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: accentColor,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7B7F87),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: accentColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.duration,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF7B7F87),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: accentColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF7B7F87),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom section - Progress bar with status on the right
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: item.progress,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.6),
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                item.status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: item.isError ? accentColor : const Color(0xFF1F1F1F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
