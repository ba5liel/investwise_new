import 'package:flutter/material.dart';
import 'package:investwise_new/core/constants/theme/app_color.dart';

class BigInput extends StatefulWidget {
  final String text;
  final double padding;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TextInputType keyboardType;

  const BigInput(
      {super.key,
      this.text = '',
      required this.onChanged,
      required this.controller,
      this.padding = 10.0,
      this.keyboardType = TextInputType.text});

  @override
  State<BigInput> createState() => _BigInputState();
}

class _BigInputState extends State<BigInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: const TextStyle(
            fontSize: 30, fontFamily: "PTSans", fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greenColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelText: widget.text,
            contentPadding: const EdgeInsets.all(40)));
  }
}
