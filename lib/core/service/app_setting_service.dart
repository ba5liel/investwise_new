import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/modal/setting/app_config.dart';
import 'package:investwise_new/core/modal/setting/app_setting.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';

class AppSettingService extends GetxService {
  late AppSetting setting;
  late AppConfig config;

  AppStorageService appStorageService = Get.find<AppStorageService>();

  AppSettingService() {
    if (appStorageService.hasKey(StorageKeys.settingBoxKey)) {
      Map<String, dynamic> data = Map<String, dynamic>.from(
          appStorageService.read<Map>(StorageKeys.settingBoxKey));
      setting = AppSetting.fromMap(data);
    } else {
      setting = AppSetting(firstTime: true);
    }
  }

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    config = AppConfig.fromMap(dotenv.env);
  }

  void save() {
    appStorageService.write(StorageKeys.settingBoxKey, setting.toMap());
  }
}
