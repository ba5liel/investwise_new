import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/login/login_controller.dart';
import 'package:investwise_new/presentation/auth/otp/otp_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/otp_input.dart';
import 'package:investwise_new/routes/app_routes.dart';

class OtpPage extends GetView<OTPController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification", style: TextStyle(fontSize: 20)),
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
                        "You have got a 6-digit code",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "We have sent a 6-digit code to your phone number and enter the code below",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  OtpInput(
                    controller: controller.otp,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid code';
                      }
                      return null;
                    },
                    onCompleted: (value) {},
                  ),
                  const SizedBox(height: 61),
                  Column(
                    children: [
                      const Text(
                        "Didn't receive the code?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          controller.resendOTPCode();
                        },
                        child: const Text(
                          "Click to resend",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green, // You can change the color
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: isKeyboardOpen ? Get.width : Get.width * 0.8,
                child: AppButton(
                  onPressed: () {
                    controller.confirmOTP();
                  },
                  text: "Confirm",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
