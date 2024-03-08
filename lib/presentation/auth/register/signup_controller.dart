import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/storage_keys.dart';
import 'package:investwise_new/core/repository/app_auth_repository.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/service/app_storage_service.dart';
import 'package:investwise_new/presentation/auth/login/login_controller.dart';
import 'package:investwise_new/routes/app_routes.dart';

class SignupController extends GetxController {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController pinNumber = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  final isSignUpLoading = false.obs;
  final _storage = Get.find<AppStorageService>();
  final _authRepository = Get.put(AppAuthRepository());
  final _logController = Get.put(LoginController());

  final AuthService _authService = Get.find<AuthService>();

  //validate phone
  String phoneValidation(phone) {
    if (phone.length == 9) {
      return "+251" + phone;
    } else if (phone.length == 12) {
      return phone;
    }
    return "";
  }

  //isuser exist
  Future<bool> isUserExist(phone) async {
    final user = _authRepository.isUserExist(phone);
    return user;
  }

  Future<void> signUp() async {
    final phone = phoneValidation(phoneNumber.text);

    final fName = firstName.text;
    final lName = lastName.text;

    if (fName.isEmpty) {
      EasyLoading.showError("First Name is required");

      return;
    }
    if (lName.isEmpty) {
      EasyLoading.showError("Last name is required");
      return;
    }

    if (phone.isEmpty) {
      EasyLoading.showError("Phone number is required");
      return;
    }

    final users = await isUserExist(phone);
    if (users) {
      EasyLoading.showError(
          "Please login with your phone number you have already registered.");
      celarForm();
      EasyLoading.dismiss();
      return;
    }

    final userData = {
      'phone': phone,
      'name': "$fName $lName",
      'pin': '',
      'nationalId': '1234567890'
    };
    EasyLoading.dismiss();

    Get.toNamed(AppRoutes.Pin);
    _storage.write(StorageKeys.currentUserKey, userData);

    isSignUpLoading.value = true;

    isSignUpLoading.value = false;
  }

  void setPin() {
    EasyLoading.show(
      status: "Loading...",
    );
    final pin = pinNumber.text;
    if (pin.isEmpty) {
      EasyLoading.showError("Pin number is required");
      return;
    }
    if (pin.length < 4) {
      EasyLoading.showError("Pin number must be 4 digits");
      return;
    }

    final userData = _storage.read(StorageKeys.currentUserKey);
    if (userData != null) {
      userData['pin'] = pin;
      _storage.write(StorageKeys.currentUserKey, userData);
    } else {
      // Handle the case where userData is null (e.g., user hasn't registered yet)
      EasyLoading.showError("User data not found. Please register first.");
      return;
    }

    _storage.write(StorageKeys.currentUserKey, userData);
    _authService.currentUser = userData;
    _authRepository.signUp(
        userData['name'], userData['phone'], userData['nationalId'], pin);

    _logController.loginWithPhone(userData['phone']);
  }

  void celarForm() {
    phoneNumber.clear();
    pinNumber.clear();
    firstName.clear();
    lastName.clear();
  }
}
