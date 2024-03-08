import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyLogoWidget extends StatelessWidget {
  const CompanyLogoWidget({Key? key, required this.image, this.size = 70})
      : super(key: key);
  final String image;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: .1),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
