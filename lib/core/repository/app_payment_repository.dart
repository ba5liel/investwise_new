import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';

class AppPaymentRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();
  final AuthService _authService = Get.find<AuthService>();

  Future<String> buy(Company company, double amount) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      'share-session',
      data: {
        "company_id": company.id,
        "user_id": _authService.currentUser!.id,
        "share_no": amount / company.pricePerShare,
        "share_value": amount
      },
    );

    return response.data?['ref_id'];
  }

  Future<void> settle(String refid) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      'share-session/success',
      data: {
        "ref_id": refid,
      },
    );
  }

  Future<String> sell(Company company, int amount) async {
    APIResponse<Map<String, dynamic>> response = await _appApiService.post(
      'share-session',
      data: {
        "company_id": company.id,
        "user_id": _authService.currentUser!.id,
        "share_no": amount / company.pricePerShare,
        "share_value": amount
      },
    );

    return response.data?['refid'];
  }
}
