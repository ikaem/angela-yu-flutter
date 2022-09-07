import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
