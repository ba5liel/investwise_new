import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final TextEditingController otp = TextEditingController();

  String? verificationId = '';

  Function(String verificationId, String smsCode)? onOTPCodeSubmitted;
  Function(String phone)? onPhoneNumSubmitted;
  VoidCallback? onResendRequested;

  void confirmOTP() {
    // Get.showSnackbar(CustomSnackBar.getSnackBar(
    //     "Your Account has been successfully confirmed."));
    if (otp.text.isEmpty) {
      EasyLoading.showError("Please enter a valid code");
      return;
    }
    if (otp.text.length < 6) {
      EasyLoading.showError("Please enter a valid code");
      return;
    }
    log(otp.text);
    if (onOTPCodeSubmitted != null &&
        verificationId != null &&
        otp.text.isNotEmpty) {
      onOTPCodeSubmitted!(verificationId!, otp.text);
    }
    // Get.toNamed(Routes.main);
  }

  void resendOTPCode() {
    if (onResendRequested != null) {
      onResendRequested!();
    }
  }

  void clear() {
    otp.clear();
  }
}
