import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("I am rich"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey.shade900,
          ),
          body: Center(
            child: Image(
              // image: NetworkImage(
              //   "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Football_%28soccer_ball%29.svg/675px-Football_%28soccer_ball%29.svg.png?20080222132737",
              // ),
              image: AssetImage("images/ball.png"),
            ),
          ),
        ),
      ),
    );
