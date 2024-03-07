import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/modal/user.dart';

class AppAuthRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();

  Future<User> signUp(String fullName, String email, String password) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      '/signup',
      data: {
        'name': fullName,
        'email': email,
        'password': password,
        "agree_gdpr": "true"
      },
    );

    return User.fromMap(response.data['data']);
  }

  Future<User> signWithGoogle(String token) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      '/oauth/google',
      data: {
        'token': token,
      },
    );

    return User.fromMap(response.data['data']);
  }

  Future<User> signWithFacebook(String token) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      '/oauth/facebook',
      data: {
        'token': token,
      },
    );

    return User.fromMap(response.data['data']);
  }

  Future<User> signIn(String email, String password) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      '/login',
      data: {
        'username_email': email,
        'password': password,
      },
    );

    return User.fromMap(response.data['data']);
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
