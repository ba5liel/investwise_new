import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:investwise_new/presentation/auth/register/signup_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/app_outline_button.dart';
import 'package:investwise_new/presentation/shared/phone_input.dart';
import 'package:investwise_new/presentation/shared/text_input.dart';
import 'package:investwise_new/routes/app_routes.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          const Center(
            child: Text(
              "Investwise",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: TextInput(
                text: 'First Name',
                controller: controller.firstName,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: Get.width * 0.8,
              child: TextInput(
                text: 'Last Name',
                controller: controller.lastName,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              )),
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
                text: 'National ID',
                controller: controller.firstName,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              )),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: AppButton(
              onPressed: () {
                Get.toNamed(AppRoutes.Pin);
              },
              text: 'Register',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 40),
            child: const Text(
              "Do you have an account?",
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
                Get.toNamed(AppRoutes.login);
              },
              text: 'Login',
            ),
          ),
        ],
      )),
    );
  }
}
