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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Thay Colors.white
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Customize your Assistant',
          style: Theme.of(context).textTheme.headlineMedium, // Sử dụng theme text
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Thay Colors.white
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor, // Thay Colors.black
        elevation: 0,
        centerTitle: true,
        iconTheme: Theme.of(context).appBarTheme.iconTheme, // Theme icon
      ),
      body: SafeArea(
        child: Consumer<FirstSetupViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: isKeyboardVisible
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

                        Row(
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
                              ),
                            ),
                            const Text(
                              ' *',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: viewModel.nameController,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color, // Text color
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your assistant name',
                            hintStyle: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium?.color, // Hint color
                            ),
                            filled: true,
                            fillColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey[800] // Dark mode fill color
                                : Colors.grey[100], // Light mode fill color
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

                        Row(
                          children: [
                            Text(
                              'Choose Avatar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.bodyLarge?.color, // Thay Colors.black87
                              ),
                            ),
                            const Text(
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
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.red[900]?.withOpacity(0.2) // Dark mode error background
                                  : Colors.red[50], // Light mode error background
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.red[400]! // Dark mode error border
                                    : Colors.red[200]!, // Light mode error border
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.red[400] // Dark mode error icon
                                      : Colors.red[600], // Light mode error icon
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    viewModel.errorMessage,
                                    style: TextStyle(
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Colors.red[400] // Dark mode error text
                                          : Colors.red[600], // Light mode error text
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor, // Background color
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).dividerColor, // Divider color
                        width: 1,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: viewModel.isLoading
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
                      child: viewModel.isLoading
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
