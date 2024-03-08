import 'package:chapasdk/chapa_payment%20initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/repository/app_payment_repository.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/utils/generic_dialog.dart';
import 'package:investwise_new/presentation/shared/otp_input.dart';
import 'package:investwise_new/routes/app_routes.dart';

class PaymentController extends GetxController {
  final AppPaymentRepository _appPaymentRepository =
      Get.find<AppPaymentRepository>();

  final AuthService _authService = Get.find<AuthService>();

  Future<String> makePay(Company company, double amount) async {
    try {
      EasyLoading.show(
        status: "Making payment...",
      );
      var ref = await _appPaymentRepository.buy(company, amount);
      EasyLoading.dismiss();
      _authService.refCompanyMap.addAll({ref: company});
      _authService.refAmountMap.addAll({ref: amount});
      return ref;
    } catch (e) {
      EasyLoading.show(status: e.toString());
      return "";
    }
  }

  bool checkPin(String currentPin) {
    return currentPin == _authService.currentUser?.pin;
  }

  TextEditingController pinController = TextEditingController();

  void payWithChapa(Company company, double amount) {
    showGenericDialog<bool>(
      context: Get.context!,
      title: "Please Enter your Pin!",
      dialogColor: AppColors.primaryColor,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OtpInput(
            controller: pinController,
            validator: (value) {
              if (value == null) {
                return "Please set pin.";
              }
            },
            onCompleted: (value) {}),
      ),
      optionsBuilder: () => {
        'Confirm': () {
          Get.back();
          if (!checkPin(pinController.text)) {
            return showError();
          }
          _make_payment(company, amount);
        },
        'Cancle': () {
          Get.back();
        },
      },
      selectedOption: 'Confirm',
    );
  }

  void showError() {
    showGenericDialog<bool>(
      icon: Icon(
        Icons.error,
        size: 60.h,
        color: AppColors.redColor,
      ),
      context: Get.context!,
      title: "Pin Incorrect! :(",
      dialogColor: AppColors.backgroundColor1,
      optionsBuilder: () => {
        'Okay': () {
          Get.back();
        },
      },
      selectedOption: 'Okay',
    );
  }

  void _make_payment(Company company, double amount) async {
    var refid = await makePay(company, amount);
    print("button presssed");
    // Add your onPressed code here!
    // ignore: use_build_context_synchronously
    Chapa.paymentParameters(
      context: Get.context!, // context
      publicKey: 'CHASECK_TEST-Pi4OhLe2XV3Aw3Qpt7eZHaugKMe1HKvm',
      currency: 'etb',
      amount: '$amount',
      email: 'xyz@gmail.com',
      phone: '251911223344',
      firstName: 'testname',
      lastName: 'lastName',
      txRef: refid,
      title: 'title',
      desc: 'desc',
      namedRouteFallBack: AppRoutes.chapaResult, // fall back route name
    );
  }
}
