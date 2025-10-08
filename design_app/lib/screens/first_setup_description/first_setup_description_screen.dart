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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Thay Colors.grey[50]
      appBar: AppBar(
        title: Text(
          'Customize your Assistant',
          style: Theme.of(context).textTheme.headlineMedium, // Theme text style
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Thay Colors.white
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor, // Thay Colors.black
        elevation: 0,
        centerTitle: true,
        iconTheme: Theme.of(context).appBarTheme.iconTheme, // Theme icon
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
                        items: viewModel.genderOptions.map((option) {
                          return DropdownMenuItem(
                            value: option.value,
                            child: Text(
                              option.label,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: viewModel.selectGender,
                      ),

                      const SizedBox(height: 20),

                      CustomDropdown<Language>(
                        label: 'Language',
                        value: viewModel.selectedLanguage,
                        items: viewModel.availableLanguages.map((language) {
                          return DropdownMenuItem(
                            value: language,
                            child: Text(
                              language.name,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
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
                        items: viewModel.responseStyleOptions.map((option) {
                          return DropdownMenuItem(
                            value: option.value,
                            child: Text(
                              option.label,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: viewModel.selectResponseStyle,
                      ),

                      const SizedBox(height: 20),

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
                        : () => viewModel.saveSetup(context),
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
