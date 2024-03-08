import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';

import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CircleAvatar(
        radius: 50,
        child: Icon(
          Icons.person,
          size: 40,
        ),
      ),
      Text(
        Get.find<AuthService>().cu?.name ?? "Test",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "PTSans", fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ]));
  }
}
