import 'package:get/route_manager.dart';
import 'package:investwise_new/presentation/auth/login/login_binding.dart';
import 'package:investwise_new/presentation/auth/login/login_screen.dart';
import 'package:investwise_new/presentation/buystock/buystock_binding.dart';
import 'package:investwise_new/presentation/buystock/buystock_screen.dart';
import 'package:investwise_new/presentation/companydetail/company_detail_binding.dart';
import 'package:investwise_new/presentation/companydetail/company_detail_screen.dart';
import 'package:investwise_new/presentation/dashboard/dashboard_binding.dart';
import 'package:investwise_new/presentation/dashboard/dashboard_screen.dart';
import 'package:investwise_new/presentation/discover/discover_binding.dart';
import 'package:investwise_new/presentation/discover/discover_screen.dart';
import 'package:investwise_new/presentation/home/home_binding.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';
import 'package:investwise_new/presentation/payment/payment_binding.dart';
import 'package:investwise_new/presentation/payment/payment_screen.dart';
import 'package:investwise_new/presentation/previewstock/preview_stock_binding.dart';
import 'package:investwise_new/presentation/previewstock/preview_stock_screen.dart';
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
    GetPage(
        name: AppRoutes.paymentConfirmation,
        page: () => const PaymentScreen(),
        binding: PaymentBinding()),
    GetPage(
        name: AppRoutes.companyDetail,
        page: () => CompanyDetailScreen(),
        binding: CompanyDetailBinding()),
    GetPage(
        name: AppRoutes.buyStock,
        page: () => BuyStockScreen(),
        binding: BuyStockBinding()),
    GetPage(
        name: AppRoutes.previewStock,
        page: () => PreviewStockScreen(),
        binding: PreviewStockBinding()),
    GetPage(
        name: AppRoutes.discover,
        page: () => DiscoverScreen(),
        binding: DiscoverBinding()),
    GetPage(
        name: AppRoutes.dashboard,
        page: () => DashboardScreen(),
        binding: DashboardBinding())
  ];
}
