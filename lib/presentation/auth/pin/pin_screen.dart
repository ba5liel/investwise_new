import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/login/login_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/otp_input.dart';

class PinScreen extends GetView<LoginController> {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PIN setup", style: TextStyle(fontSize: 20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set your Pin code 🔐",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Add a PIN to make your account more secure, we may ask for Pin for every stock purchase.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  OtpInput(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid code';
                      }
                      return null;
                    },
                    onCompleted: (value) {},
                  ),
                  const SizedBox(height: 61),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: isKeyboardOpen ? Get.width : Get.width * 0.8,
                child: AppButton(
                  onPressed: () {},
                  text: "Set Pin",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
