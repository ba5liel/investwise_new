import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/login/login_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/app_outline_button.dart';
import 'package:investwise_new/presentation/shared/phone_input.dart';
import 'package:investwise_new/presentation/shared/text_input.dart';
import 'package:investwise_new/routes/app_page.dart';
import 'package:investwise_new/routes/app_routes.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SvgPicture.asset(
            'assets/login.svg',
            width: Get.width * 0.8,
          ),
          const Center(
            child: Text(
              "Investwise",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: PhoneInput(
                hint: 'Phone Number',
                controller: controller.phoneNumber,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: TextInput(
                text: 'Pin Number',
                controller: controller.pinNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: AppButton(
              onPressed: () {
                controller.login();
              },
              text: 'Login',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 40),
            child: const Text(
              "Don't have an account?",
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: AppButtonOutline(
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              },
              text: 'Register',
            ),
          ),
        ],
      )),
    );
  }
}
