import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/utils/formatter.dart';
import 'package:investwise_new/core/utils/generic_dialog.dart';
import 'package:investwise_new/presentation/payment/payment_controller.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/widget/company_logo.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen(
      {super.key,
      required this.sell,
      required this.amount,
      required this.company});
  final bool sell;
  final double amount;
  final Company company;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 45.h),
              child: Row(
                children: [
                  IconButton(
                      onPressed: Get.back,
                      icon: Icon(Icons.arrow_back, size: 28.sp)),
                  SizedBox(width: 5.w),
                  Text(
                    "Preview ${sell ? 'Sell' : 'Buy'}",
                    style: AppTextTheme.PR_SANSHeaderStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CompanyLogoWidget(image: company.image),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                company.name,
                                style: AppTextTheme.PR_SANSSubTitleStyle,
                              ),
                              SizedBox(height: 8.h),
                              const Text('SPOT')
                            ],
                          )
                        ],
                      ),
                      Text("${sell ? 'Sell' : 'Buy'} in ETB")
                    ],
                  ),
                  SizedBox(height: 20.h),
                  const Divider(thickness: .1),
                  SizedBox(height: 20.h),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xfff0f0f0)),
                        color: AppColors.greyishColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PreviewBuyInfoTile(
                          title: 'Market Price',
                          value: AppFormatter.formatCurrency(71.05),
                        ),
                        const SizedBox(height: 15.0),
                        const PreviewBuyInfoTile(
                          title: 'Number of Shares',
                          value: '0.013659756',
                        ),
                        const SizedBox(height: 15.0),
                        const Divider(thickness: .1),
                        const SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Amount',
                          value: AppFormatter.formatCurrency(10000.00),
                        ),
                        const SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Trading Fee',
                          value: AppFormatter.formatCurrency(50.00),
                        ),
                        const SizedBox(height: 15.0),
                        const Divider(thickness: .1),
                        const SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Total Cost',
                          value: AppFormatter.formatCurrency(amount),
                          valueColor: AppColors.greenColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppButton(
                text: 'Pay with chapa',
                onPressed: () {
                  PaymentController().payWithChapa(company, amount);
                }),
          ],
        ),
      ),
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
}

class PreviewBuyInfoTile extends StatelessWidget {
  const PreviewBuyInfoTile(
      {super.key,
      required this.value,
      required this.title,
      this.valueColor = Colors.black});
  final String title;
  final String value;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp),
        ),
        Text(
          value,
          style: AppTextTheme.PR_SANS20W700CBlack.copyWith(
              fontSize: 18.sp, color: valueColor),
        ),
      ],
    );
  }
}
