import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/modal/response/api_response.dart';
import 'package:investwise_new/core/service/app_api_service.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';

class AppCompanyRepository {
  final AppApiService _appApiService = Get.find<AppApiService>();
  final AuthService _authService = Get.find<AuthService>();

  Future<List<Company>> getCompanies() async {
    APIResponse<List<dynamic>> response =
        await _appApiService.get('companies', data: {});

    return response.data!.map((e) => Company.fromMap(e)).toList();
  }
}
