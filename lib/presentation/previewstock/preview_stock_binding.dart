import 'package:get/get.dart';
import 'package:investwise_new/presentation/buystock/buystock_controller.dart';
import 'package:investwise_new/presentation/previewstock/preview_stock_controller.dart';

class PreviewStockBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PreviewStockController());
  }
}
