import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/routes/app_routes.dart';

Widget TopCompany() {
  return Expanded(
    child: InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.companyDetail);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 30, right: 30),
        decoration: BoxDecoration(
            color: AppColors.lightWhiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.whiteColor),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.building,
                color: AppColors.greenColor,
              )),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Text(
                  "TWTR",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "PTSans",
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "+35%",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PTSans",
                      color: AppColors.greenColor),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
