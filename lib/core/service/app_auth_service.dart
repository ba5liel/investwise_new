import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';
import 'package:investwise_new/core/modal/setting/app_config.dart';
import 'package:investwise_new/core/modal/user.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';
import 'package:investwise_new/routes/app_routes.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<AppStorageService>();
  final firebaseAuthInstance = FirebaseAuth.instance;
  UserData? currentUser;
  String? token;
  bool rememberThisDevice = false;
  Future<AuthService> init() async {
    UserData? user = await userData();
    if (user != null) {
      rememberThisDevice = true;
      currentUser = user;
    }

    return this;
  }

  bool isLoggedIn() => rememberThisDevice;

  Future<void> logout() async {
    EasyLoading.show(status: "Logging out...");

    await firebaseAuthInstance.signOut();
    await _storageService.clear();
    Get.toNamed(AppRoutes.login);
    EasyLoading.dismiss();
  }

  Future<UserData?> userData() async {
    final storedData = await _storageService.read(StorageKeys.currentUserKey);

    if (storedData != null && storedData is Map<dynamic, dynamic>) {
      final userData = UserData.fromMap(storedData.cast<String, dynamic>());
      return userData;
    } else {
      return null;
    }
  }

  Future<void> signInWithPhone(
      String phoneNumber,
      int? resendToken,
      Function(String error) onError,
      Function(PhoneAuthCredential credential) onCompleted,
      Function(String verificationId, int? resendToken) onOTPCodeSent) async {
    FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (credential) async {
              onCompleted(credential);
            },
            verificationFailed: (exception) {
              if (exception.code == "invalid-phone-number") {
                onError("Invalid phone number");
              } else {
                onError(exception.message!);
              }
            },
            codeSent: (verificationId, resendToken) {
              onOTPCodeSent(verificationId, resendToken);
            },
            forceResendingToken: resendToken,
            timeout: const Duration(seconds: 8),
            codeAutoRetrievalTimeout: (verificationId) {})
        .timeout(const Duration(minutes: 2), onTimeout: () {
      onError("Connection Failed");
    });
  }
}
