// lib/screens/first_setup/first_setup_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'first_setup_viewmodel.dart';
import '../../widgets/common/avatar_frame_widget.dart';
import '../../widgets/common/avatar_grid_widget.dart';

class FirstSetupScreen extends StatelessWidget {
  const FirstSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Customize your Assistant'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<FirstSetupViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics:
                        isKeyboardVisible
                            ? const AlwaysScrollableScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AvatarFrameWidget(
                            imagePath: viewModel.selectedAvatar?.imagePath,
                            displayName: viewModel.assistantName,
                            width: 220,
                            height: 300,
                          ),
                        ),

                        const SizedBox(height: 32),

                        const Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: viewModel.nameController,
                          decoration: InputDecoration(
                            hintText: 'Your assistant name',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          onChanged: (_) => viewModel.onNameChanged(),
                        ),

                        const SizedBox(height: 24),

                        const Row(
                          children: [
                            Text(
                              'Choose Avatar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        AvatarGridWidget(
                          avatars: viewModel.availableAvatars,
                          selectedAvatar: viewModel.selectedAvatar,
                          onAvatarSelected: viewModel.selectAvatar,
                        ),

                        const SizedBox(height: 16),

                        if (viewModel.errorMessage.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red[200]!),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red[600],
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    viewModel.errorMessage,
                                    style: TextStyle(
                                      color: Colors.red[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        SizedBox(height: isKeyboardVisible ? 100 : 20),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:
                          viewModel.isLoading
                              ? null
                              : () => viewModel.saveAndContinue(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF81C784),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child:
                          viewModel.isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
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
