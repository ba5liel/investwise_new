import 'package:get/instance_manager.dart';
import 'package:investwise_new/presentation/payment/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PaymentController());
  }
}
