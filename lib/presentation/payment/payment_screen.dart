import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/presentation/shared/widget/company_logo.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Card(
              child: Padding(
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
                    Divider(),
                    Text('Market Price'),
                    Text('\$71.05'),
                    SizedBox(height: 8.0),
                    Text('Number of Shares'),
                    Text('0.013659756'),
                    SizedBox(height: 8.0),
                    Text('Amount'),
                    Text('\$10,000.00'),
                    SizedBox(height: 8.0),
                    Text('Trading Fee'),
                    Text('\$50.00'),
                    Divider(),
                    Text('Total Cost'),
                    Text('\$10,050.00'),
                  ],
                ),
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
