import 'dart:convert';

import 'package:investwise_new/core/modal/company.dart';

class StockShare {
  final int id;
  final int sharesOwned;
  final Company company;
  StockShare({
    required this.id,
    required this.sharesOwned,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sharesOwned': sharesOwned,
      'company': company.toMap(),
    };
  }

  factory StockShare.fromMap(Map<String, dynamic> map) {
    return StockShare(
      id: map['id']?.toInt() ?? 0,
      sharesOwned: map['sharesOwned']?.toInt() ?? 0,
      company: Company.fromMap(map['company']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StockShare.fromJson(String source) =>
      StockShare.fromMap(json.decode(source));
}
