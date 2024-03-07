import 'dart:convert';

enum AppEnv { dev, prod }

class AppConfig {
  final String baseURL;
  final AppEnv env;
  final bool showDevScreen;
  AppConfig({
    required this.baseURL,
    required this.env,
    required this.showDevScreen,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseURL': baseURL,
      'env': env,
      'showDevScreen': showDevScreen,
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      baseURL: map['baseURL'] ?? '',
      env: AppEnv.values.firstWhere(
          (e) => e.name.toLowerCase() == (map['env'] as String).toLowerCase()),
      showDevScreen: map['showDevScreen'] == 'true',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));
}
