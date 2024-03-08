import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/routes/app_routes.dart';

Widget MyStockDynamic(String logo, String name, int pricePerShare) {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoutes.companyDetail);
    },
    child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            // color: AppColors.backgroundColor2,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.backgroundColor3),
                  child: Image(
                    image: AssetImage(
                      logo,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "PTSans",
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: Text(
                        name.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "PTSans",
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${pricePerShare} Br.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "PTSans",
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(
                    "+25%",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PTSans",
                        color: AppColors.whiteColor),
                  ),
                ),
              ],
            )
          ],
        )),
  );
}
