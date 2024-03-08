import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';
import 'package:investwise_new/presentation/shared/top_compay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.greenColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontFamily: "PTSans",
          fontSize: 12,
          fontWeight: FontWeight.bold,
          // Add other desired TextStyle properties here
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: "PTSans",
          // Add other desired TextStyle properties here
        ),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.houseChimney,
              color: AppColors.greenColor,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.chartArea,
                color: AppColors.green,
              ),
              label: "Portfolio"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.compass,
                color: AppColors.green,
              ),
              label: "Discover"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userCircle,
                color: AppColors.green,
              ),
              label: "Account")
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
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
                                  child: FaIcon(
                                    FontAwesomeIcons.chartColumn,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
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
                              child: FaIcon(
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
                          "2,900,000 Br.",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "PTSans",
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
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
                    Container(
                      height: 140,
                      width: Get.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [TopCompany(), TopCompany(), TopCompany()],
                      ),
                    ),
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
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          MyStock("assets/coop.png"),
                          MyStock("assets/coop.png"),
                          MyStock("assets/coop.png"),
                          MyStock("assets/coop.png"),
                          MyStock("assets/coop.png"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
