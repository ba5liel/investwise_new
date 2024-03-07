import 'package:get/get.dart';
import 'package:investwise_new/core/modal/user.dart';
import 'package:investwise_new/core/repository/app_auth_repository.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';

enum AuthStatus { authenticated, unauthenticated, blocked }

class AppAuthService extends GetxService {
  final AppStorageService _storageService = Get.find<AppStorageService>();
  late AppAuthRepository _authRepository;

  AuthStatus authStatus = AuthStatus.unauthenticated;

  User? user;
  String? authToken;

  void setRepository(AppAuthRepository appAuthRepository) {
    _authRepository = appAuthRepository;
  }

  Future<void> init() async {
    var userMap = _storageService.readMap(StorageKeys.currentUserKey);
    if (userMap != null) {
      user = User.fromMap(userMap);
    }
    authToken = _storageService.read(StorageKeys.tokenKey);
    // refreshToken = _storageService.read(StorageKeys.refreshTokenKey);

    if (authToken != null) authStatus = AuthStatus.authenticated;
  }

  Future<void> signup(String fullName, String email, String password) async {
    user = await _authRepository.signUp(fullName, email, password);

    setUser(user!);
  }

  Future<void> signWithGoogle(String token) async {
    user = await _authRepository.signWithGoogle(token);

    setUser(user!);
  }

  Future<void> signWithFacebook(String token) async {
    user = await _authRepository.signWithFacebook(token);

    setUser(user!);
  }

  Future<void> signin(String email, String password) async {
    try {
      user = await _authRepository.signIn(email, password);

      setUser(user!);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    user = null;
    await _storageService.clear();
    // await Get.offAllNamed(AppRoutes.EMAILAUTHENTICATIONPAGE);
  }

  Future<void> requestOTP(String email) async {
    await _authRepository.requestOTP(email);
  }

  Future<void> resendOtp(String email) async {
    await _authRepository.resendOtp(email);
  }

  Future<String> verifyOtp(String email, String otp) async {
    return await _authRepository.verifyOtp(email, otp);
  }

  Future<String> resetPassword(
      String token, String newpassword, String confirmPassword) async {
    return await _authRepository.resetPassword(
        token, newpassword, confirmPassword);
  }

  bool setUser(User newUser, {bool settoken = true}) {
    _storageService.write(StorageKeys.currentUserKey, newUser.toMap());
    user = newUser;
    if (settoken) {
      // authToken = newUser.token;

      _storageService.write(StorageKeys.tokenKey, authToken);
      // _storageService.write(StorageKeys.refreshTokenKey, refreshToken);
    }
    return true;
  }
}
