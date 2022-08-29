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
          body: Image(
            image: NetworkImage(
                "https://cooldot.co/wp-content/uploads/2018/12/Antibacterial-Sitting-Ball-Chair-Yoga-Ball-Brown-min.jpg"),
          ),
        ),
      ),
    );
