import 'package:flutter/material.dart';

// TextTheme customTextTheme = TextTheme(
//   bodyText1: const TextStyle(
//     color: Colors.white,
//   ),
//   labelLarge: const TextStyle(
//     color: Colors.red,
//   ),
//   labelSmall: const TextStyle(
//     color: Colors.red,
//   ),
//   labelMedium: const TextStyle(
//     color: Colors.red,
//   ),
// );

TextTheme customTextTheme = Typography.whiteRedmond.copyWith(
    titleMedium: TextStyle(
      color: Colors.grey,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 80,
    ));
