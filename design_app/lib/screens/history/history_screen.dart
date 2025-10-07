// lib/screens/history/history_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'history_viewmodel.dart';
import 'widgets/history_header.dart';
import 'widgets/history_tabs.dart';
import 'widgets/expert_history_list.dart';
import 'widgets/chichi_history_item.dart';
import '../home/widgets/bottom_navigation.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryViewModel>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Consumer<HistoryViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                const HistoryHeader(),

                HistoryTabs(
                  selectedIndex: viewModel.selectedTabIndex,
                  onTabSelected: viewModel.selectTab,
                ),

                Expanded(
                  child:
                      viewModel.selectedTabIndex == 0
                          ? ExpertHistoryList(
                            histories: viewModel.expertHistories,
                            onHistoryTap:
                                (historyId, expertId) =>
                                    viewModel.openExpertChat(context, expertId),
                            onDeleteTap: viewModel.deleteExpertHistory,
                          )
                          : ChiChiHistoryItem(
                            hasHistory: viewModel.hasChiChiHistory,
                            onTap: () => viewModel.openChiChiChat(context),
                            onDelete: viewModel.deleteChiChiHistory,
                          ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
