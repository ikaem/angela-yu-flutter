import 'package:bmi/navigation/routes.dart';
import 'package:bmi/screens/home_screen.dart';
import 'package:bmi/screens/results_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> createRoutes(
      BuildContext context) {
    return {
      Routes.home: (context) => const HomeScreen(),
      Routes.results: (context) => const ResultsScreen(),
    };
  }

  static toHome(BuildContext context) =>
      Navigator.pushNamed(context, Routes.home);
  static toResults(BuildContext context) =>
      Navigator.pushNamed(context, Routes.results);
}
