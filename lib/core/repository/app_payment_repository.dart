import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/service/app_api_service.dart';

class AppPaymentRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();

  Future<String> buy(Company company, double amount) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      'share-session',
      data: {
        "company_id": company.id,
        "user_id": 30,
        "share_no": amount / company.pricePerShare,
        "share_value": amount
      },
    );

    return response.data?['ref_id'];
  }

  Future<String> sell(Company company, int amount) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      'share-session',
      data: {
        "company_id": company.id,
        "user_id": 30,
        "share_no": amount / company.pricePerShare,
        "share_value": amount
      },
    );

    return response.data?['refid'];
  }
}
