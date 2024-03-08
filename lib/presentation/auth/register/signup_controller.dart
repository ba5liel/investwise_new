import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController pinNumber = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final isSignUpLoading = false.obs;

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
  Future<bool> isUserExist() async {
    return false;
  }
}
