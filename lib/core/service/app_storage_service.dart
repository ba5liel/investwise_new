import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class AppStorageService extends GetxService {
  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('investwise_new');
  }

  void write(String key, dynamic value) {
    _box.put(key, value);
  }

  bool hasKey(String key) {
    return _box.containsKey(key);
  }

  T read<T>(String key) {
    return _box.get(key) as T;
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Map<String, dynamic>? readMap(String key,
      [Map<String, dynamic>? defaultValue]) {
    Map? map = _box.get(key, defaultValue: defaultValue);
    if (map != null) return Map<String, dynamic>.from(map);
    return null;
  }

  Future<void> clear() async {
    await _box.clear();
    await _box.deleteAll(_box.keys);
  }
}
