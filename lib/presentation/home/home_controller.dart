import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/modal/stock_share.dart';
import 'package:investwise_new/core/repository/app_company_repository.dart';
import 'package:investwise_new/core/repository/app_share_repository.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  final _companyRepository = Get.put(AppCompanyRepository());
  var totalAmount = 0.0.obs;
  RxList<Company> companies = <Company>[].obs;
  final _appShareRepository = Get.put(AppShareRepository());
  RxList<StockShare> mylist = <StockShare>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<List<StockShare>> getMyStocks() async {
    var list = await _appShareRepository.getUSerShares();
    for (var element in list) {
      totalAmount.value +=
          (element.sharesOwned * element.company.pricePerShare);
    }
    return list;
  }

  Future<void> getCompanies() async {
    isLoading.value = true;

    EasyLoading.show(
      status: "loading",
    );

    final responseCompanies = await _companyRepository.getCompanies();

    if (!responseCompanies.isEmpty) {
      final response = await getMyStocks();

      if (!response.isEmpty) {
        mylist.addAll(response);
      }
      companies.addAll(responseCompanies);
    }

    isLoading.value = false;
    EasyLoading.dismiss();
  }
}
