import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/shared/big_input.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';
import 'package:investwise_new/presentation/shared/text_input.dart';
import 'package:investwise_new/routes/app_routes.dart';

class SellStockScreen extends StatelessWidget {
  SellStockScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
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
                                  child: const FaIcon(
                                    FontAwesomeIcons.arrowLeftLong,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const Text(
                                "Sell Stock",
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
                            child: const FaIcon(
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
                      MyStock("assets/coop.png"),
                      const SizedBox(
                        height: 10,
                      ),
                      BigInput(
                        controller: _textEditingController,
                        onChanged: (val) {},
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Available Balance in Stock/Equity 432,000 Br.",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "PTSans",
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenColor,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.previewStock);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: AppColors.greenColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Text(
                                  "Sell",
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
