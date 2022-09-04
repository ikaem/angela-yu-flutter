import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const RoundIconButton({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: Theme.of(context).colorScheme.tertiary,
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,
      ),
      elevation: 16,
      child: Icon(icon),
    );
  }
}
