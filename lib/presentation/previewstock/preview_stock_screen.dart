import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';
import 'package:investwise_new/presentation/shared/text_input.dart';

class PreviewStockScreen extends StatelessWidget {
  PreviewStockScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

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
                      AppColors.greenConfirmationColor, // Start color
                      AppColors.greenColor, // End color
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
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Preview Purchase",
                                style: TextStyle(
                                  fontSize: 20,
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
                              FontAwesomeIcons.heart,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(20),
                  color: AppColors.appBgColor,
                  child: Column(
                    children: [
                      Container(
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
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: AppColors.backgroundColor3),
                                    child: Image(
                                      image: AssetImage(
                                        "assets/coop.png",
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Coop Bank",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "PTSans",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        child: Text(
                                          "COOP",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "PTSans",
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Buy in Progress",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "PTSans",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor2,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Market Price",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PTSans",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "24,000 Br.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PTSans",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Share Amount",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PTSans",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "2 ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PTSans",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fee",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PTSans",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "300 Br.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PTSans",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PTSans",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "24,300 Br.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "PTSans",
                                      fontWeight: FontWeight.bold,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: AppColors.greenColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Text(
                                  "Buy Now",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
