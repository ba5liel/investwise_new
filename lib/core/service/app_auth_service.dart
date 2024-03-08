import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';
import 'package:investwise_new/core/modal/setting/app_config.dart';
import 'package:investwise_new/core/modal/user.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<AppStorageService>();
  final firebaseAuthInstance = FirebaseAuth.instance;

  String? token;
  bool rememberThisDevice = false;
  Future<AuthService> init() async {
    UserData user = await userData();

    if (user.name != null) {
      rememberThisDevice = true;
    }

    return this;
  }

  bool isLoggedIn() => rememberThisDevice;

  Future<void> logout() async {
    await firebaseAuthInstance.signOut();
    await _storageService.clear();
  }

  Future<UserData> userData() async {
    return UserData.fromMap(
        await _storageService.read(StorageKeys.currentUserKey));
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
