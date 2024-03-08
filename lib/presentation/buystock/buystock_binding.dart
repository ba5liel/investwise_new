import 'package:get/get.dart';
import 'package:investwise_new/presentation/buystock/buystock_controller.dart';

class BuyStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => BuyStockController());
  }
}
