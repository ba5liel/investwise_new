import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/login/login_binding.dart';
import 'package:investwise_new/presentation/auth/login/login_screen.dart';
import 'package:investwise_new/presentation/home/home_binding.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';
import 'package:investwise_new/routes/app_page.dart';
import 'package:investwise_new/routes/app_routes.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const RegisterPage(),
      home: const LoginScreen(),
      initialRoute: AppRoutes.login,
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}
