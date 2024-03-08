import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/shared/my_stock.dart';
import 'package:investwise_new/presentation/shared/top_compay.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackColor,
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
                                  FontAwesomeIcons.compass,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Discover",
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
                        height: 16,
                      ),
                      TextField(
                          controller: _textEditingController,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "PTSans",
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.greenColor, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              labelText: "Search here",
                              contentPadding: const EdgeInsets.all(16)))
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      "All Companies",
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
    );
  }
}
