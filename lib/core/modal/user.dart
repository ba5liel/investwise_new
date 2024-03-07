import 'dart:convert';

class User {
  final String? name;
  final String phone;
  final String pin;
  final String? id;

  User({
    this.name,
    required this.phone,
    required this.pin,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      pin: map['pin'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
