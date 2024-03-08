import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/pin/pin_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinController>(() => PinController());
  }
}
