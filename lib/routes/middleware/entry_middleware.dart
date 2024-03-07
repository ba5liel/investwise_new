import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_setting_service.dart';
import 'package:investwise_new/routes/app_routes.dart';

class EntryMiddleware extends GetMiddleware {
  final AppAuthService _authService = Get.find<AppAuthService>();
  final AppSettingService _settingService = Get.find<AppSettingService>();

  @override
  RouteSettings? redirect(String? route) {
    if (_authService.authStatus == AuthStatus.authenticated) {
      return const RouteSettings(
        name: AppRoutes.home, //TODO: change to home page
      );
    }
    if (!_settingService.setting.firstTime) {
      return const RouteSettings(name: AppRoutes.paymentConfirmation);
    }
    return super.redirect(route);
  }
}
