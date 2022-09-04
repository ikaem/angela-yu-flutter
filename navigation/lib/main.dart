import 'package:flutter/material.dart';
import 'package:navigation/router/routes.dart';

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
      routes: createRoutes(context),
      // home: HomeScreen(),
      initialRoute: "/",
    );
  }
}
