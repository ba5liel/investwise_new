import 'package:get/get.dart';

class PinController extends GetxController {
  final pin = ''.obs;
  final isPinCorrect = false.obs;
  final isPinError = false.obs;
  final isPinLoading = false.obs;

  void onPinChanged(String value) {
    pin.value = value;
  }

  void onPinSubmitted() {
    isPinLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      if (pin.value == '1234') {
        isPinCorrect.value = true;
        isPinError.value = false;
      } else {
        isPinCorrect.value = false;
        isPinError.value = true;
      }
      isPinLoading.value = false;
    });
  }
}
