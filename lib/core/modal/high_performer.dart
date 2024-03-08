import 'dart:convert';

class HighPerformer {
  final String name;
  final String image;
  final String description;
  HighPerformer({
    required this.name,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
    };
  }

  factory HighPerformer.fromMap(Map<String, dynamic> map) {
    return HighPerformer(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HighPerformer.fromJson(String source) =>
      HighPerformer.fromMap(json.decode(source));
}
