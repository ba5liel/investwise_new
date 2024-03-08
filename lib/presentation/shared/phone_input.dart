import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInput extends StatefulWidget {
  final void Function(String) onChanged;
  final TextEditingController controller;
  final String hint;
  const PhoneInput(
      {required this.onChanged,
      required this.controller,
      this.hint = 'Phone Number',
      super.key});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.controller,
      decoration: InputDecoration(
        isCollapsed: false,
        labelText: widget.hint,
        alignLabelWithHint: false,
        counterText: '',
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      initialCountryCode: 'ET',
      showDropdownIcon: false,
      onChanged: (phone) {
        widget.onChanged(phone.completeNumber);
      },
    );
  }
}
