import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/presentation/dashboard/dashboard_controller.dart';
import 'package:investwise_new/presentation/discover/discover_screen.dart';
import 'package:investwise_new/presentation/home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final widgets = [HomeScreen(), DiscoverScreen()];

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
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
          selectedIconTheme: IconThemeData(color: AppColors.greenColor),
          type: BottomNavigationBarType.fixed,
          currentIndex: dashboardController.currentNav.value,
          onTap: (value) {
            dashboardController.changeNav(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.houseChimney,
                color: AppColors.green,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.compass,
                  color: AppColors.green,
                ),
                label: "Discover"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.chartArea,
                  color: AppColors.green,
                ),
                label: "Portfolio"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.userCircle,
                  color: AppColors.green,
                ),
                label: "Account")
          ],
        ),
      ),
      body: Obx(() => widgets[dashboardController.currentNav.value]),
    ));
  }
}
