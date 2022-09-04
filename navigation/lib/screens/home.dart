import 'package:flutter/material.dart';
import 'package:navigation/screens/screen_2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              Text("hello screen home"),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Screen1(),
                  //   ),
                  // );
                  // Navigator.pushNamed(context, "/screen1");
                  //  we can do this too
                  Navigator.of(context).pushNamed("/screen1");
                },
                child: Text("Go to screen 1"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(),
                    ),
                  );
                },
                child: Text("Go to screen 2"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
