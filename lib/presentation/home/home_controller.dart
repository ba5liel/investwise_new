import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/repository/app_company_repository.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final _companyRepository = Get.put(AppCompanyRepository());

  RxList<Company> companies = <Company>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<void> getCompanies() async {
    isLoading.value = true;

    EasyLoading.show(
      status: "loading companies",
    );

    final response = await _companyRepository.getCompanies();

    companies.assignAll(response);

    EasyLoading.dismiss();
  }
}
