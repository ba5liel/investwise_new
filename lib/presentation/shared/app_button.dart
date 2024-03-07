import 'package:flutter/material.dart';

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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          backgroundColor:
              widget.isButtonEnabled ? const Color(0xff24d598) : Colors.grey,
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        onPressed: widget.isButtonEnabled ? () => _onButtonPressed() : null,
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

  void _onButtonPressed() {
    // Add your button press logic here
    print('Button Pressed!');
  }
}
