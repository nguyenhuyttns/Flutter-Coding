// lib/screens/permission/permission_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'permission_viewmodel.dart';
import 'widgets/permission_header.dart';
import 'widgets/permission_content.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PermissionViewModel>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Consumer<PermissionViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                const PermissionHeader(),
                Expanded(
                  child: PermissionContent(
                    isAllowAccess: viewModel.isAllowAccess,
                    onToggleAccess: viewModel.toggleAccess,
                    onGetStarted: () => viewModel.onGetStarted(context),
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
