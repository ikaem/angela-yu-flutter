import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.yellow.shade400,
          appBar: AppBar(
            title: Text("Just test"),
            centerTitle: true,
          ),
          body: Center(
            child: Image(
              image: AssetImage("assets/images/poor-ball.jpg"),
            ),
          ),
        ),
      ),
    );
