import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/modal/high_performer.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';

class FollowStockController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final List<HighPerformer> highPerformers = [
    HighPerformer(
        name: "Dr. Abiy Ahmed",
        image: "assets/performers/0.jpeg",
        description: "Prime Minister of Ethiopia"),
    HighPerformer(
        name: "Eshetu Melese",
        image: "assets/performers/1.jpeg",
        description: "Comedian and\nInternet personality"),
    HighPerformer(
        name: "Ermias Amelga",
        image: "assets/performers/2.jpg",
        description: "Influential entrepreneur"),
    HighPerformer(
        name: "Eleni Gabre-Madhin",
        image: "assets/performers/3.jpeg",
        description: "Ethiopian-Swiss economist"),
  ];
  Future<void> makePay(Company company, double amount) async {
    try {
      EasyLoading.show(
        status: "Making payment...",
      );
      // var ref = await _appFollowStockRepository.buy(company, amount);
      EasyLoading.dismiss();
      // return ref;
    } catch (e) {
      EasyLoading.show(status: e.toString());
    }
  }
}
