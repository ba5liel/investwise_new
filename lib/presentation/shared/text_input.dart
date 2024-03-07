import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TextInputType keyboardType;

  const TextInput(
      {super.key,
      this.text = '',
      required this.onChanged,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: widget.text,
        ));
  }
}
