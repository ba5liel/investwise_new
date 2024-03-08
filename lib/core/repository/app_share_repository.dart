import 'package:get/get.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/modal/stock_share.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';

class AppShareRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();
  final AuthService _authService = Get.find<AuthService>();

  Future<List<StockShare>> getUSerShares() async {
    APIResponse<Map<String, dynamic>> response = await _appApiService
        .get('users/${_authService.currentUser!.id}', data: {});

    return (response.data!["ownedShares"] as List)
        .map((e) => StockShare.fromMap(e))
        .toList();
  }
}
