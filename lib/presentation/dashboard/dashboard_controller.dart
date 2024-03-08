import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentNav = 0.obs;

  void changeNav(int val) {
    print(val);
    currentNav.value = val;
  }
}
