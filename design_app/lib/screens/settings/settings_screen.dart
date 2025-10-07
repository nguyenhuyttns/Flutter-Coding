// lib/screens/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_viewmodel.dart';
import 'widgets/settings_header.dart';
import 'widgets/settings_list.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsViewModel>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<SettingsViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                const SettingsHeader(),
                Expanded(
                  child: SettingsList(
                    items: viewModel.settingsItems,
                    onItemTap:
                        (item) => viewModel.onSettingItemTap(context, item),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
