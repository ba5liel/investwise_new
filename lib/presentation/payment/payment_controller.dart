import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/repository/app_payment_repository.dart';

class PaymentController extends GetxController {
  final AppPaymentRepository _appPaymentRepository =
      Get.find<AppPaymentRepository>();
  Future<String> makePay(Company company, double amount) async {
    try {
      EasyLoading.show(
        status: "Making payment...",
      );
      var ref = await _appPaymentRepository.buy(company, amount);
      EasyLoading.dismiss();
      return ref;
    } catch (e) {
      EasyLoading.show(status: e.toString());
      return "";
    }
  }
}
