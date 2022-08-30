import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Container(
            height: 100,
            width: 100,
            // margin: EdgeInsets.all(20),
            // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            // margin: EdgeInsets.fromLTRB(20, 100, 20, 11),
            margin: EdgeInsets.only(left: 123),
            padding: EdgeInsets.only(left: 90),
            color: Colors.white,
            child: Text(
              "I am kaem",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
