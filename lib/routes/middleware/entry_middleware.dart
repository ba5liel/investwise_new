import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_setting_service.dart';
import 'package:investwise_new/routes/app_routes.dart';

class EntryMiddleware extends GetMiddleware {
  final AuthService _authService = Get.find<AuthService>();
  final AppSettingService _settingService = Get.find<AppSettingService>();

  @override
  RouteSettings? redirect(String? route) {
    if (!_settingService.setting.firstTime) {
      return const RouteSettings(name: AppRoutes.paymentConfirmation);
    }
    return super.redirect(route);
  }
}
