import 'dart:ui';

import 'package:get/get.dart';

class OTPController extends GetxController {
  final otp = ''.obs;

  String? verificationId = '';

  Function(String verificationId, String smsCode)? onOTPCodeSubmitted;
  Function(String phone)? onPhoneNumSubmitted;
  VoidCallback? onResendRequested;

  String smsCode = '';

  void confirmOTP() {
    // Get.showSnackbar(CustomSnackBar.getSnackBar(
    //     "Your Account has been successfully confirmed."));
    if (onOTPCodeSubmitted != null &&
        verificationId != null &&
        smsCode.isNotEmpty) {
      onOTPCodeSubmitted!(verificationId!, smsCode);
    }
    // Get.toNamed(Routes.main);
  }

  void resendOTPCode() {
    if (onResendRequested != null) {
      onResendRequested!();
    }
  }

  void clear() {
    otp.value = '';
    smsCode = '';
  }
}
