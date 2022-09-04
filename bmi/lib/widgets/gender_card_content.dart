import 'package:flutter/material.dart';

class GenderCardContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderCardContent({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
