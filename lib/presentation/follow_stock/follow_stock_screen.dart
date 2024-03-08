import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/constants/theme/app_theme.dart';
import 'package:investwise_new/core/utils/generic_dialog.dart';
import 'package:investwise_new/presentation/follow_stock/follow_stock_controller.dart';
import 'package:investwise_new/presentation/shared/widget/company_logo.dart';

class FollowStockScreen extends StatelessWidget {
  FollowStockScreen({
    super.key,
  });

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
                    "Follow Stock",
                    style: AppTextTheme.PR_SANSHeaderStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var performer in FollowStockController().highPerformers)
                    FollowerRow(
                      description: performer.description,
                      name: performer.name,
                      image: performer.image,
                    ),
                ],
              ),
            ),
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

class FollowerRow extends StatelessWidget {
  const FollowerRow(
      {super.key,
      required this.image,
      required this.name,
      required this.description});
  final String image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CompanyLogoWidget(image: image),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextTheme.PR_SANSSubTitleStyle,
                    ),
                    SizedBox(height: 8.h),
                    Text(description)
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(AppRoutes.buyStock);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Follow",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "PTSans",
                      fontSize: 13.sp,
                      color: AppColors.appBgColor,
                      height: 1.8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Divider(thickness: .1),
        const SizedBox(height: 8.0),
      ],
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
