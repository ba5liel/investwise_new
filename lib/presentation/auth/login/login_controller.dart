import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/repository/app_auth_repository.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/presentation/auth/otp/otp_controller.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';
import 'package:investwise_new/routes/app_routes.dart';

class LoginController extends GetxController {
  final _authService = Get.put(AuthService());
  final _authRepository = Get.put(AppAuthRepository());

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController pinNumber = TextEditingController();

  //validate login with phone and pin
  Future<void> login() async {
    final phone = phoneNumber.text;
    final pin = pinNumber.text;

    if (phone.isEmpty) {
      log("Phone number is required");
      EasyLoading.showError("Phone number is required");
      return;
    }

    if (pin.isEmpty) {
      EasyLoading.showError("Pin number is required");
      return;
    }

    final users = await _authRepository.signIn(phoneValidation(phone), pin);
    if (users) {
      loginWithPhone(phoneValidation(phone));
    } else {
      clearForm();
      return;
    }
  }

  // phon validation
  String phoneValidation(phone) {
    if (phone.length == 9) {
      return "+251" + phone;
    } else if (phone.length == 12) {
      return phone;
    }
    return "";
  }

  Future<void> loginWithPhone(String phoneNumber,
      {int? resendToken, String? status}) async {
    EasyLoading.show(
      status: status,
    );

    _authService.signInWithPhone(phoneNumber, resendToken, (error) {
      log(error);
      //on error handler
      EasyLoading.showError(error, duration: const Duration(seconds: 13));
    }, (credential) {
      //on authentication completed handler
      _completePhoneAuth(credential);
    }, (verificationId, resendToken) {
      final otpController = Get.put(OTPController());
      //OTP code sent handler
      otpController.clear();
      otpController.verificationId = verificationId;

      otpController.onResendRequested = () {
        loginWithPhone(phoneNumber,
            resendToken: resendToken, status: "Resending");
      };

      otpController.onOTPCodeSubmitted = (verificationId, smsCode) {
        _verifyOTP(verificationId, smsCode);
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

    userCredential.user?.getIdToken().then((value) {
      if (value != null) {
        Get.to(const HomeScreen());
      }
    });

    EasyLoading.dismiss();
  }

  Future<void> _verifyOTP(String verificationId, String smsCode) async {
    EasyLoading.show(
      status: "Verifying OTP...",
    );

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _completePhoneAuth(credential);
    } catch (e) {
      log("Error verifying OTP: $e");
      EasyLoading.showError("Invalid OTP, please try again.");
    }
  }

  void clearForm() {
    phoneNumber.clear();
    pinNumber.clear();
  }
}
