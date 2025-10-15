import 'package:flutter/material.dart';
import 'package:apps/generate_screen.dart';
import 'package:apps/project_empty_screen.dart';

class AppRoutes {
  static const String generate = '/generate';
  static const String projectEmpty = '/projects/empty';

  static final Map<String, WidgetBuilder> routes = {
    generate: (context) => const GenerateScreen(),
    projectEmpty: (context) => const ProjectEmptyScreen(),
  };
}
