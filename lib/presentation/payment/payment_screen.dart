import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/presentation/shared/widget/company_logo.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                    "Preview Buy",
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
                          const CompanyLogoWidget(
                              image: "assets/company_logo/airlines.png"),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spotify',
                                style: AppTextTheme.PR_SANSSubTitleStyle,
                              ),
                              SizedBox(height: 8.h),
                              const Text('SPOT')
                            ],
                          )
                        ],
                      ),
                      const Text('Buy in ETB')
                    ],
                  ),
                  SizedBox(height: 20.h),
                  const Divider(thickness: .1),
                  SizedBox(height: 20.h),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfff0f0f0)),
                        color: AppColors.greyishColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 25.w),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PreviewBuyInfoTile(
                          title: 'Market Price',
                          value: '\$71.05',
                        ),
                        SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Number of Shares',
                          value: '0.013659756',
                        ),
                        SizedBox(height: 15.0),
                        Divider(thickness: .1),
                        SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Amount',
                          value: '\$10,000.00',
                        ),
                        SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Trading Fee',
                          value: '\$50.00',
                        ),
                        SizedBox(height: 15.0),
                        Divider(thickness: .1),
                        SizedBox(height: 15.0),
                        PreviewBuyInfoTile(
                          title: 'Total Cost',
                          value: '\$10,050.00',
                          valueColor: AppColors.greenColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Text('Buy Now'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // background (button) color
                onPrimary: Colors.white, // foreground (text) color
              ),
            ),
          ],
        ),
      ),
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
