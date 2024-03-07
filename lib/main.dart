import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/routes/app_page.dart';
import 'package:investwise_new/routes/app_routes.dart';

void main() {
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
        initialRoute: AppRoutes.paymentConfirmation,
        getPages: AppPages.pages,
        theme: AppTheme.appTheme,
      ),
    );
  }
}
