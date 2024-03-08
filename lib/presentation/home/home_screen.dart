import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/utils/formatter.dart';
import 'package:investwise_new/presentation/home/home_controller.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';
import 'package:investwise_new/presentation/shared/top_compay.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  // image: DecorationImage(image: AssetImage("assets/green.jpg"), fit: BoxFit.contain)
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.greenColor, // Start color
                      AppColors.greenConfirmationColor, // End color
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
                              Container(
                                child: const FaIcon(
                                  FontAwesomeIcons.chartColumn,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "InvestWise",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "PTSans",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.black20Color),
                            child: const FaIcon(
                              FontAwesomeIcons.bell,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppFormatter.formatCurrency(
                            _homeController.totalAmount.value),
                        style: const TextStyle(
                            fontSize: 40,
                            fontFamily: "PTSans",
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Total Stock Balance",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "PTSans",
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: AppColors.appBgColor,
              width: Get.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Text(
                      "Top Companies",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "PTSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => _homeController.companies.isEmpty
                      ? Container()
                      : Container(
                          height: 140,
                          width: Get.width,
                          child: ListView.builder(
                            itemCount: _homeController.companies.length,
                            itemBuilder: (context, index) {
                              return TopCompany(
                                  _homeController.companies[index].name,
                                  _homeController.companies[index].image,
                                  index);
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      "My Stocks",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "PTSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(
                      () => _homeController.mylist.isNotEmpty
                          ? ListView.builder(
                              itemCount: _homeController.mylist.length,
                              itemBuilder: ((context, index) {
                                return MyStock(_homeController
                                    .mylist[index].company.image);
                              }),
                              scrollDirection: Axis.vertical,
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
