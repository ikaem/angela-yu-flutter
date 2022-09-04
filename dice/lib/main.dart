import 'dart:math';

import 'package:flutter/material.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int dice1Flex = 4;
  int dice2Flex = 4;
  int dice1Value = 1;
  int dice2Value = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              //expanded has to be a child of a row or a column
              Expanded(
                flex: dice1Flex,
                child: TextButton(
                  onPressed: () {
                    print("hello on pressed on a dice");
                    final num = _rollDice();

                    setState(() {
                      dice1Flex = 4;
                      dice2Flex = 3;
                      dice1Value = num;
                    });
                  },
                  child: Image.asset("assets/images/dice$dice1Value.png"),
                ),
              ),
              Expanded(
                flex: dice2Flex,
                child: TextButton(
                  onPressed: () {
                    print("this is pressing the right dice");
                    final num = _rollDice();
                    setState(() {
                      dice1Flex = 3;
                      dice2Flex = 4;
                      dice2Value = num;
                    });
                  },
                  child: Image.asset(
                      // width: 100,
                      "assets/images/dice$dice2Value.png"),
                ),
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              setState(() {
                dice1Flex = 4;
                dice2Flex = 4;
                dice1Value = _rollDice();
                dice2Value = _rollDice();
              });
            },
            child: Text(
              "Roll both",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  int _rollDice() {
    final int num = Random().nextInt(6);
    print("this is num: $num");
    return num + 1;
  }
}
