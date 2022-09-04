import 'package:flutter/material.dart';
import 'package:navigation/screens/home.dart';
import 'package:navigation/screens/screen_1.dart';
import 'package:navigation/screens/screen_2.dart';
import 'package:navigation/screens/screen_3.dart';

Map<String, Widget Function(BuildContext)> createRoutes(BuildContext context) {
  return {
    "/": (BuildContext context) => HomeScreen(),
    "/screen1": (BuildContext context) => Screen1(),
    "/screen2": (BuildContext context) => Screen2(),
    "/screen3": (BuildContext context) => Screen3(),
  };
}
