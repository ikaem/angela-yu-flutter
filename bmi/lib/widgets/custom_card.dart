import 'package:flutter/material.dart';

typedef OnTap = void Function();

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final OnTap? onTap;

  const CustomCard({
    Key? key,
    required this.color,
    this.onTap,
    this.cardChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 100,
        // child: Text("Hello"),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
