import 'package:get/instance_manager.dart';
import 'package:investwise_new/presentation/discover/discover_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => DiscoverController());
  }
}
