import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/modal/user.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';

class AppAuthRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();
  final AuthService _authService = Get.find<AuthService>();
  final _storage = Get.find<AppStorageService>();

  Future<UserData> signUp(
      String fullName, String phone, String nationalId, String pin) async {
    EasyLoading.show(
      status: "Loading...",
    );
    log("log 3");
    final response = await _appApiService.post(
      'users/signup',
      data: {
        'name': fullName,
        'phone': phone,
        'pin': pin,
        "nationalId": nationalId
      },
    );
    log("log 4");
    log("=======>${response.data}");

    return UserData.fromMap(response.data!);
  }

  Future<bool> isUserExist(String phone) async {
    EasyLoading.show(
      status: "Loading...",
    );
    APIResponse<Map<String, dynamic>> response =
        await _appApiService.get('users/isExist/$phone', data: {
      'phone': phone,
    });

    if (response.data == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> signIn(String phone, String pin) async {
    EasyLoading.show(
      status: "Loading...",
    );

    final response = await _appApiService.post(
      '/users/login',
      data: {
        'phone': phone,
        'pin': pin,
      },
    );

    if (response.data == null) {
      EasyLoading.showError("Please add the valid phone number and pin");
      EasyLoading.dismiss();
      return false;
    } else {
      final userData = UserData.fromMap(response.data!);
      _storage.write(StorageKeys.currentUserKey, userData);
      _authService.currentUser = userData;
      EasyLoading.dismiss();

      // Assuming successful login, use userData here (store, navigate, etc.)
      return true;
    }
  }

  Future<String> requestOTP(String email) async {
    APIResponse response = await _appApiService.post(
      '/requestOtp',
      data: {
        'email': email,
      },
    );
    return response.msg!;
  }

  Future<String> resendOtp(String email) async {
    APIResponse response = await _appApiService.post(
      '/resendOtp',
      data: {
        'email': email,
      },
    );
    return response.msg!;
  }

  Future<String> verifyOtp(String email, String otp) async {
    APIResponse response = await _appApiService.post(
      '/verifyotp',
      data: {
        'email': email,
        "otp": otp,
      },
    );
    return response.data['data'];
  }

  Future<String> resetPassword(
      String token, String newPassword, String confirmPassword) async {
    APIResponse response = await _appApiService.post(
      '/reset',
      data: {
        'token': token,
        "password": newPassword,
        "password_confirmation": confirmPassword,
      },
    );
    return response.data['data'];
  }
}
