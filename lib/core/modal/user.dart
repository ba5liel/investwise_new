import 'dart:convert';

class UserData {
  final String? name;
  final String phone;
  final String pin;
  final String? id;

  UserData({
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

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      pin: map['pin'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
