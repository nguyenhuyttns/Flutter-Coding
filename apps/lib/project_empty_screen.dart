import 'package:flutter/material.dart';
import 'package:apps/mock_data_project.dart';
import 'package:apps/widgets/project_item_card.dart';
import 'package:apps/widgets/notice_max_popup.dart';

class ProjectEmptyScreen extends StatefulWidget {
  const ProjectEmptyScreen({super.key});

  @override
  State<ProjectEmptyScreen> createState() => _ProjectEmptyScreenState();
}

class _ProjectEmptyScreenState extends State<ProjectEmptyScreen> {
  @override
  void initState() {
    super.initState();
    // Show notice if items count is 10 or more
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mockProjects.length >= 10) {
        NoticeMaxPopup.show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = mockProjects;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F7FB),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Projects',
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (items.isEmpty)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 16,
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFF8A34),
                            ),
                            child: const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: 136,
                            height: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF2D6),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFFFF8A34),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFFFF8A34),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFFFF8A34),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Your List is Empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F1F1F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(
                    width: 260,
                    child: Text(
                      "Looks like you haven't added anything to your history list yet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7B7F87),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return ProjectItemCard(item: items[index]);
                },
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 88,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _BottomNavItem(
                      icon: Icons.home_outlined,
                      label: 'Home',
                      isActive: false,
                    ),
                    SizedBox(width: 120),
                    _BottomNavItem(
                      icon: Icons.folder,
                      label: 'Projects',
                      isActive: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  final IconData icon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFFF8A34) : const Color(0xFF7B7F87),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFFFF8A34) : const Color(0xFF7B7F87),
          ),
        ),
      ],
    );
  }
}
