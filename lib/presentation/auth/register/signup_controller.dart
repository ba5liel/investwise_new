import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController pinNumber = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final isSignUpLoading = false.obs;
}
