import 'package:flash_chat/style/constants.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
  final String hintText;
  final OnChanged onChanged;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: kAuthInputTextFieldDecoration.copyWith(hintText: hintText),
    );
  }
}
