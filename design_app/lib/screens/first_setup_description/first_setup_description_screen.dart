// lib/screens/first_setup_description/first_setup_description_screen.dart
import 'package:design_app/models/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'first_setup_description_viewmodel.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/custom_text_field.dart';

class FirstSetupDescriptionScreen extends StatefulWidget {
  const FirstSetupDescriptionScreen({super.key});

  @override
  State<FirstSetupDescriptionScreen> createState() =>
      _FirstSetupDescriptionScreenState();
}

class _FirstSetupDescriptionScreenState
    extends State<FirstSetupDescriptionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FirstSetupDescriptionViewModel>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Customize your Assistant'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<FirstSetupDescriptionViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown<String>(
                        label: 'Gender',
                        value: viewModel.selectedGender,
                        items:
                            viewModel.genderOptions.map((option) {
                              return DropdownMenuItem(
                                value: option.value,
                                child: Text(option.label),
                              );
                            }).toList(),
                        onChanged: viewModel.selectGender,
                      ),

                      const SizedBox(height: 20),

                      CustomDropdown<Language>(
                        label: 'Language',
                        value: viewModel.selectedLanguage,
                        items:
                            viewModel.availableLanguages.map((language) {
                              return DropdownMenuItem(
                                value: language,
                                child: Text(language.name),
                              );
                            }).toList(),
                        onChanged: viewModel.selectLanguage,
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Who will your chatbot be?',
                        controller: viewModel.chatbotRoleController,
                        hintText: 'Math Teacher',
                        onChanged: (_) => viewModel.onTextChanged(),
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Details about your expert',
                        controller: viewModel.expertDetailsController,
                        hintText: 'Teaching Math',
                        maxLines: 4,
                        onChanged: (_) => viewModel.onTextChanged(),
                      ),

                      const SizedBox(height: 20),

                      CustomDropdown<String>(
                        label: 'Response Style',
                        value: viewModel.selectedResponseStyle,
                        items:
                            viewModel.responseStyleOptions.map((option) {
                              return DropdownMenuItem(
                                value: option.value,
                                child: Text(option.label),
                              );
                            }).toList(),
                        onChanged: viewModel.selectResponseStyle,
                      ),

                      const SizedBox(height: 20),

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
                            : () => viewModel.saveSetup(context),
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
                              'Save',
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
    );
  }
}
