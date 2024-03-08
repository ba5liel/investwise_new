import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';
import 'package:investwise_new/core/modal/company.dart';
import 'package:investwise_new/core/service/app_auth_service.dart';
import 'package:investwise_new/core/utils/formatter.dart';
import 'package:investwise_new/presentation/shared/app_button.dart';
import 'package:investwise_new/presentation/shared/widget/company_logo.dart';
import 'package:investwise_new/routes/app_routes.dart';

class PaymentSuccess extends StatefulWidget {
  PaymentSuccess({Key? key, required this.sell}) : super(key: key);
  final bool sell;
  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  final ConfettiController _controllerCenter =
      ConfettiController(duration: const Duration(seconds: 10));

  final AuthService _authService = Get.find<AuthService>();

  var args;
  Company? company;
  double? amount;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        if (ModalRoute.of(context)?.settings.arguments != null) {
          args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            print('message after payment');
            print(args['message']);
            print(args);
            company = _authService.refCompanyMap[args['transactionReference']]!;
            amount = _authService.refAmountMap[args['transactionReference']]!;
          }
        }
      });
    });

    _controllerCenter.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 150.h, horizontal: 30.w),
            child: Column(children: [
              SizedBox(width: 150.h),
              CompanyLogoWidget(
                  size: 170,
                  image:
                      company?.image ?? "assets/company_logo/placeholder.jpeg"),
              Stack(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                        true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    // createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                          onPressed: () {
                            _controllerCenter.play();
                          },
                          child: Text(
                            amount == null
                                ? "--"
                                : AppFormatter.formatCurrency(amount!),
                            style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 45.sp,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "${widget.sell ? 'Sell' : 'Buy'} Order Recieved",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 28.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Your order has been recieved and will be processed as soon as possible!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Divider(thickness: .1),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppButton(
                        text: "View my portfolio",
                        onPressed: () {
                          Get.toNamed(AppRoutes.dashboard);
                        },
                      )
                    ],
                  ),
                ),
              ])
            ])));
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
