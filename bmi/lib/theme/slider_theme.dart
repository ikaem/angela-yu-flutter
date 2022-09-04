import 'package:flutter/material.dart';

SliderThemeData sliderTheme(BuildContext context) {
  return SliderTheme.of(context).copyWith(
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
  );
}
