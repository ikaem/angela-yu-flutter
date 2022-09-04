import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("hello screen 3"),
              TextButton(
                onPressed: () {},
                child: Text("Go to screen home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
