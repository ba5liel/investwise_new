import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';
import 'package:investwise_new/core/service/init_app_service.dart';
import 'package:investwise_new/firebase_options.dart';
import 'package:investwise_new/routes/app_page.dart';
import 'package:investwise_new/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get.put(AppStorageService());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initAppService();
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, _) => GetMaterialApp(
        title: 'Invest wise',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.dashboard,
        initialRoute: _getInitialRoute(),
        getPages: AppPages.pages,
        theme: AppTheme.appTheme,
        builder: EasyLoading.init(),
      ),
    );
  }

  String _getInitialRoute() {
    final userStatusChecker = Get.put(AuthService());
    return userStatusChecker.isLoggedIn() ? AppRoutes.home : AppRoutes.login;
  }
}
