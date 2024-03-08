import 'package:get/get.dart';
import 'package:investwise_new/presentation/companydetail/company_detail_controller.dart';

class CompanyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => CompanyDetailController());
  }
}
