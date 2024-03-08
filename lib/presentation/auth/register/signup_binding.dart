import 'package:get/get.dart';
import 'package:investwise_new/presentation/auth/register/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
