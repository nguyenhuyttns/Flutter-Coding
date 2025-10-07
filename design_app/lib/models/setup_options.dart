// lib/models/setup_options.dart
class GenderOption {
  final String value;
  final String label;

  const GenderOption({required this.value, required this.label});

  static const List<GenderOption> all = [
    GenderOption(value: 'male', label: 'Male'),
    GenderOption(value: 'female', label: 'Female'),
    GenderOption(value: 'other', label: 'Other'),
  ];
}

class ResponseStyleOption {
  final String value;
  final String label;

  const ResponseStyleOption({required this.value, required this.label});

  static const List<ResponseStyleOption> all = [
    ResponseStyleOption(value: 'short_simple', label: 'Short, simple'),
    ResponseStyleOption(value: 'detailed', label: 'Detailed'),
    ResponseStyleOption(value: 'creative', label: 'Creative'),
    ResponseStyleOption(value: 'professional', label: 'Professional'),
    ResponseStyleOption(value: 'casual', label: 'Casual'),
    ResponseStyleOption(value: 'humorous', label: 'Humorous'),
  ];
}
