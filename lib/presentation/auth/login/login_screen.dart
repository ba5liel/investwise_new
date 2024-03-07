import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/login/login_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/app_outline_button.dart';
import 'package:investwise_new/presentation/shared/text_input.dart';

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
              "investwise_new",
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
              child: TextInput(
                text: 'Phone Number',
                controller: controller.phoneNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: TextInput(
                text: 'Pin Number',
                controller: controller.phoneNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: AppButton(
              onPressed: () {},
              text: 'Login',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Don't have an account?",
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: AppButtonOutline(
              onPressed: () {},
              text: 'Register',
            ),
          ),
        ],
      )),
    );
  }
}
