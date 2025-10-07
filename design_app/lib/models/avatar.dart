class Avatar {
  final String id;
  final String imagePath;
  final String name;

  Avatar({required this.id, required this.imagePath, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Avatar && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
