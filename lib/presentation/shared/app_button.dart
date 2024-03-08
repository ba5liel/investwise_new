import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {
  final void Function() onPressed;
  final bool isButtonEnabled;
  final String text;

  const AppButton(
      {super.key,
      required this.onPressed,
      this.isButtonEnabled = true,
      required this.text});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          backgroundColor:
              widget.isButtonEnabled ? const Color(0xff24d598) : Colors.grey,
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        onPressed: widget.isButtonEnabled ? () => widget.onPressed() : null,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
