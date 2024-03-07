import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_setting_service.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';

Future<void> initAppService() async {
  //App storage service

  var appStorageService = AppStorageService();
  await appStorageService.init();

  Get.put<AppStorageService>(appStorageService);

  //App setting service

  var appSettingService = AppSettingService();
  await appSettingService.init();

  Get.put<AppSettingService>(appSettingService);

  //App Auth service
  AuthService appAuthService = AuthService();
  await appAuthService.init();
  Get.put<AuthService>(appAuthService);

  //App API service

  var appAPIService = AppApiService();
  Get.put<AppApiService>(appAPIService);

  // Get.put(AppPropertyService());
}
