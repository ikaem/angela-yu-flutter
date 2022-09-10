import 'package:flutter/material.dart';

//TODO might not be needed to pass a context, but lets do it for practice
typedef OnPressed = void Function(BuildContext context);

class CustomMaterialButton extends StatelessWidget {
  final Color color;
  final String label;
  final OnPressed onPressed;

  const CustomMaterialButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.5,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: () {
          onPressed(context);
        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(label),
      ),
    );
  }
}
