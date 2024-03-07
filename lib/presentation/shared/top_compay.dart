import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';

Widget TopCompany() {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.lightWhiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            width: 10,
          ),
          Column(
            children: [
              Text(
                "TWTR",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "+35%",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenColor),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
