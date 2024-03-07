import 'package:flutter/material.dart';

class AppButtonOutline extends StatefulWidget {
  final void Function() onPressed;
  final bool isButtonEnabled;
  final String text;

  const AppButtonOutline(
      {super.key,
      required this.onPressed,
      this.isButtonEnabled = true,
      required this.text});

  @override
  _AppButtonOutlineState createState() => _AppButtonOutlineState();
}

class _AppButtonOutlineState extends State<AppButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          side: BorderSide(
            color:
                widget.isButtonEnabled ? const Color(0xff24d598) : Colors.grey,
          ),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color:
                widget.isButtonEnabled ? const Color(0xff24d598) : Colors.grey,
          ),
        ),
        onPressed: widget.isButtonEnabled ? () => widget.onPressed() : null,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color:
                widget.isButtonEnabled ? const Color(0xff24d598) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
