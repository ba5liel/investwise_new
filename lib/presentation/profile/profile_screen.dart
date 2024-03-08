import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';

import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: 100, // Set width and height to create a circular shape
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white, // Set border color
              width: 2.0, // Set border width
            ),
          ),
          child: CircleAvatar(
            radius:
                48, // Adjust the radius to fit within the container with border
            backgroundColor:
                Colors.transparent, // Set background color to transparent
            child: ClipOval(
              child: Image.network(
                'https://i.pravatar.cc/300',
                fit: BoxFit.cover,
                width: 96, // Adjust width to fit within the CircleAvatar
                height: 96, // Adjust height to fit within the CircleAvatar
              ),
            ),
          ),
        ),
        Text(
          Get.find<AuthService>().currentUser?.name ?? "Test",
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontFamily: "PTSans", fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
        ),
        const Divider(),
        ListTile(
          title: const Text('Phone Name'),
          subtitle: Text(
            Get.find<AuthService>().currentUser?.phone ?? "Test",
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: "PTSans",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.edit),
        ),
        const Divider(),
        const Divider(),
        ListTile(
          title: const Text('Wallet'),
          subtitle: Text(
            Get.find<AuthService>().currentUser?.phone ?? "Test",
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: "PTSans",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.edit),
        ),
        const Divider(),
        SizedBox(
          height: Get.height * 0.2,
        ),
        SizedBox(
            width: Get.width * 0.8,
            child: AppButton(
                onPressed: () {
                  Get.find<AuthService>().logout();
                },
                text: "LogOut"))
      ]),
    ));
  }
}
