import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/presentation/auth/otp/otp_controller.dart';
import 'package:investwise_new/routes/app_routes.dart';

class LoginController extends GetxController {
  final _authService = Get.put(AuthService());

  final TextEditingController phoneNumber = TextEditingController();

  Future<void> _loginWithPhone(String phoneNumber,
      {int? resendToken, String? status}) async {
    EasyLoading.show(
      status: status,
    );
    _authService.signInWithPhone(phoneNumber, resendToken, (error) {
      //on error handler
      EasyLoading.showError(error, duration: const Duration(seconds: 5));
    }, (credential) {
      //on authentication completed handler
      _completePhoneAuth(credential);
    }, (verificationId, resendToken) {
      final otpController = Get.find<OTPController>();
      //OTP code sent handler
      otpController.clear();
      otpController.verificationId = verificationId;

      otpController.onResendRequested = () {
        _loginWithPhone(phoneNumber,
            resendToken: resendToken, status: "Resending");
      };

      otpController.onOTPCodeSubmitted = (verificationId, smsCode) {
        return _completePhoneAuth(PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode));
      };

      EasyLoading.dismiss();
      if (Get.currentRoute != AppRoutes.otp) {
        Get.toNamed(AppRoutes.otp);
      }
    });
  }

  Future<void> _completePhoneAuth(PhoneAuthCredential credential) async {
    EasyLoading.dismiss();
    EasyLoading.show(
      status: "Verifying...",
    );

    var userCredential = await _authService.firebaseAuthInstance
        .signInWithCredential(credential);

    EasyLoading.dismiss();
  }
}
