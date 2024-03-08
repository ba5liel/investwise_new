import 'package:get/route_manager.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/presentation/auth/login/login_binding.dart';
import 'package:investwise_new/presentation/auth/login/login_screen.dart';
import 'package:investwise_new/presentation/auth/otp/otp_binding.dart';
import 'package:investwise_new/presentation/auth/otp/otp_screen.dart';
import 'package:investwise_new/presentation/auth/pin/pin_binding.dart';
import 'package:investwise_new/presentation/auth/pin/pin_controller.dart';
import 'package:investwise_new/presentation/auth/pin/pin_screen.dart';
import 'package:investwise_new/presentation/auth/register/signup_binding.dart';
import 'package:investwise_new/presentation/auth/register/signup_screen.dart';
import 'package:investwise_new/presentation/home/home_binding.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';
import 'package:investwise_new/presentation/payment/payment_binding.dart';
import 'package:investwise_new/presentation/payment/payment_screen.dart';
import 'package:investwise_new/presentation/payment/payment_success.dart';
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
        name: AppRoutes.register,
        page: () => const SignUpScreen(),
        binding: SignupBinding()),
    GetPage(
        name: AppRoutes.otp,
        page: () => const OtpPage(),
        binding: OtpBinding()),
    GetPage(
        name: AppRoutes.Pin,
        page: () => const PinScreen(),
        binding: PinBinding()),
    GetPage(
        name: AppRoutes.paymentConfirmation,
        page: () => PaymentScreen(
              sell: false,
              amount: 10,
              company: Company(
                  id: 1,
                  name: "Airlines",
                  totalShares: 10,
                  avlShares: 15,
                  pricePerShare: 10,
                  image: "assets/company_logo/airlines.png"),
            ),
        binding: PaymentBinding()),
    GetPage(
        name: AppRoutes.chapaResult,
        page: () => PaymentSuccess(),
        binding: PaymentBinding()),
  ];
}
