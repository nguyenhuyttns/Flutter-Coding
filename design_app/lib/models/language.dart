// lib/models/language.dart
class Language {
  final String code;
  final String name;
  final String countryCode;
  
  Language({
    required this.code,
    required this.name,
    required this.countryCode,
  });
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}
