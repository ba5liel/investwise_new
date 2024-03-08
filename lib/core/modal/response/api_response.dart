import 'dart:convert';

class APIResponse<T> {
  final T? data;
  final String? msg;
  APIResponse({
    required this.data,
    this.msg,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'message': msg,
    };
  }

  factory APIResponse.fromMap(Map<String, dynamic> map) {
    return APIResponse<T>(
      data: map["data"] != null ? map["data"] as T : null,
      msg:
          map['message'] is String ? map['message'] : map['message'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory APIResponse.fromJson(String source) =>
      APIResponse.fromMap(json.decode(source));
}
