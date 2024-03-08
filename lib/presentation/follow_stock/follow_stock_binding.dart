import 'package:get/instance_manager.dart';
import 'package:investwise_new/presentation/follow_stock/follow_stock_controller.dart';
import 'package:investwise_new/presentation/payment/payment_controller.dart';

class FollowStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FollowStockController());
  }
}
