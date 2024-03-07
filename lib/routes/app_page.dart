import 'package:get/route_manager.dart';
import 'package:investwise_new/presentation/auth/login/login_binding.dart';
import 'package:investwise_new/presentation/auth/login/login_screen.dart';
import 'package:investwise_new/presentation/home/home_binding.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';
import 'package:investwise_new/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [...pageList];

  static final pageList = [
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
  ];
}
