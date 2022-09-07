import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function();

class RecalculateBMIButton extends StatelessWidget {
  final OnTap onTap;

  const RecalculateBMIButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            "Calculate".toUpperCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        color: Theme.of(context).colorScheme.tertiary,
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: bottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
      ),
    );
  }
}
