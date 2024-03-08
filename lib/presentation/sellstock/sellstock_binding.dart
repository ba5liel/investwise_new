import 'package:get/get.dart';
import 'package:investwise_new/presentation/sellstock/sellstock_controller.dart';

class SellStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => SellStockController());
  }
}
