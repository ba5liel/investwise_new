import 'dart:convert';

class Company {
  final int id;
  final String name;
  final int totalShares;
  final int avlShares;
  final int pricePerShare;
  final String image;
  Company({
    required this.id,
    required this.name,
    required this.totalShares,
    required this.avlShares,
    required this.pricePerShare,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalShares': totalShares,
      'avlShares': avlShares,
      'pricePerShare': pricePerShare,
      'image': image,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        totalShares: map['totalShares']?.toInt() ?? 0,
        avlShares: map['avlShares']?.toInt() ?? 0,
        pricePerShare: map['pricePerShare']?.toInt() ?? 0,
        image: "assets/company_logo/airlines.png");
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));
}
