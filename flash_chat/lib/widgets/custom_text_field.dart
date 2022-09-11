import 'package:flash_chat/style/constants.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
  final String hintText;
  final OnChanged onChanged;
  final bool? isObscureText;
  final bool? isEmailInput;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.isObscureText,
      this.isEmailInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: isEmailInput == true ? TextInputType.emailAddress : null,
      obscureText: isObscureText ?? false,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      decoration: kAuthInputTextFieldDecoration.copyWith(hintText: hintText),
    );
  }
}
