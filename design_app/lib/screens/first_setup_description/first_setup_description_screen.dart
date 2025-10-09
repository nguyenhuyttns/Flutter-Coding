// lib/screens/first_setup_description/first_setup_description_screen.dart
import 'package:design_app/models/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'first_setup_description_viewmodel.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/custom_text_field.dart';
import '../../config/constants.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: ImageIcon(
            AssetImage(AppImages.iconback),
            color: Theme.of(context).iconTheme.color,
            size: 24,
          ),
        ),
        title: Text(
          'Customize your Assistant',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).textTheme.headlineMedium?.color,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement reset functionality
              // viewModel.resetForm();
            },
            icon: ImageIcon(
              AssetImage(AppImages.iconreset),
              color: const Color(0xFF50C880),
              size: 24,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, 
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor, 
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
                        items: viewModel.genderOptions.map((option) {
                          return DropdownMenuItem(
                            value: option.value,
                            child: Text(
                              option.label,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
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
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
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
                        showHelpIcon: true,
                        onHelpTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Help',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                content: Text(
                                  'Define the role or profession of your AI assistant. For example: Math Teacher, Life Coach, Programming Mentor, etc.',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text(
                                      'OK',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onChanged: (_) => viewModel.onTextChanged(),
                      ),

                      const SizedBox(height: 20),

                      CustomTextField(
                        label: 'Details about your expert',
                        controller: viewModel.expertDetailsController,
                        hintText: 'Teaching Math',
                        maxLines: 4,
                        showHelpIcon: true,
                        onHelpTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Help',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                content: Text(
                                  'Provide detailed information about your expert\'s background, skills, and expertise. This helps the AI understand how to respond appropriately.',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: Text(
                                      'OK',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
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
                                ? Colors.red[900]?.withOpacity(0.2) 
                                : Colors.red[50], 
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.red[400]! 
                                  : Colors.red[200]!, 
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.red[400] 
                                    : Colors.red[600], 
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  viewModel.errorMessage,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.red[400] 
                                        : Colors.red[600], 
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
                  color: Theme.of(context).scaffoldBackgroundColor, 
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
                        : Text(
                            'Save',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
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
