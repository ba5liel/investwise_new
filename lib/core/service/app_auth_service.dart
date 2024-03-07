import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<AppStorageService>();
  final firebaseAuthInstance = FirebaseAuth.instance;

  String? token;
  bool rememberThisDevice = false;
  Future<AuthService> init() async {
    //fetch current user
    // await _loadUserInfo();
    // print("Current user: ${currentUser}, Remember Me ${rememberThisDevice}");
    print("Token: $token");
    return this;
  }

  bool isLoggedIn() => rememberThisDevice;

  // Future<void> _loadUserInfo() async {
  //   var rememberDevice = await _storageService.read(AppConfig.rememberDevice);
  //   rememberThisDevice =
  //       rememberDevice != null ? bool.parse(rememberDevice) : false;

  //   if (rememberThisDevice) {
  //     String? userData = await _storageService.read(AppConfig.storageUserKey);
  //     token = await _storageService.read(AppConfig.storageTokenKey);

  //     if (userData != null && userData.isNotEmpty) {
  //       // currentUser = UserModel.fromJson(userData);
  //     }
  //   } else {
  //     await logout();
  //   }
  // }

  // Future<void> setUser(UserModel user, String tkn, bool rememberDevice) async {
  //   currentUser = user;
  //   token = tkn;
  //   rememberThisDevice = true;
  //   await _storageService.write(AppConfig.storageUserKey, user.toJson());
  //   await _storageService.write(AppConfig.storageTokenKey, tkn);
  //   await _storageService.write(
  //       AppConfig.rememberDevice, rememberDevice.toString());
  // }

  // Future<void> updateUser(UserModel user) async {
  //   currentUser = user;
  //   await _storageService.write(AppConfig.storageUserKey, user.toJson());
  // }

  Future<void> logout() async {
    await firebaseAuthInstance.signOut();
    await _storageService.clear();
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
                onError("Something went wrong (SMS Quota exceeded)");
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
