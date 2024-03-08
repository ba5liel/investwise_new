import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/routes/app_routes.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';

class CompanyDetailScreen extends StatelessWidget {
  CompanyDetailScreen({super.key});

  final List<SalesData> chartData = [
    SalesData(new DateTime(2010), 35),
    SalesData(new DateTime(2012), 35),
    SalesData(new DateTime(2014), 15),
    SalesData(new DateTime(2015), 5),
    SalesData(new DateTime(20177), 45),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.blackColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  // image: DecorationImage(image: AssetImage("assets/green.jpg"), fit: BoxFit.contain)
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.blue, // Start color
                      AppColors.lightBlueColor, // End color
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  child: FaIcon(
                                    FontAwesomeIcons.arrowLeftLong,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.black20Color),
                            child: FaIcon(
                              FontAwesomeIcons.heart,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                      MyStock("assets/coop.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 220,
                        child: Chart(layers: [
                          ChartAxisLayer(
                            settings: ChartAxisSettings(
                              x: ChartAxisSettingsAxis(
                                frequency: 1.0,
                                max: 13.0,
                                min: 7.0,
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 10.0,
                                ),
                              ),
                              y: ChartAxisSettingsAxis(
                                frequency: 100.0,
                                max: 300.0,
                                min: 0.0,
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                            labelX: (value) => value.toInt().toString(),
                            labelY: (value) => value.toInt().toString(),
                          ),
                          ChartLineLayer(
                            items: List.generate(
                              13 - 7 + 1,
                              (index) => ChartLineDataItem(
                                value: Random().nextInt(280) + 20,
                                x: index.toDouble() + 7,
                              ),
                            ),
                            settings: const ChartLineSettings(
                                thickness: 4.0,
                                color: AppColors.bottomBarColor),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(20),
                  color: AppColors.appBgColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              Text(
                                "200,000 Br",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "PTSans",
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+27% (210.00 Br.)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "PTSans",
                                        fontSize: 16,
                                        color: AppColors.greenColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          child: const Text(
                            "Summary",
                            style: TextStyle(
                                fontFamily: "PTSans",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          child: const Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: "PTSans",
                                fontSize: 16,
                                height: 1.8),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: AppColors.green,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    "Sell",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "PTSans",
                                        fontSize: 16,
                                        height: 1.8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.buyStock);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: AppColors.greenColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Text(
                                    "Buy",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "PTSans",
                                        fontSize: 16,
                                        color: AppColors.appBgColor,
                                        height: 1.8),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
