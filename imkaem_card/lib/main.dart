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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/me.jpg"),
              ),
              Text(
                "Karlo Marinović",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
              Text(
                "App Developer".toUpperCase(),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontFamily: "Roboto Mono",
                  fontSize: 20,
                  letterSpacing: 1.6,
                ),
              ),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade400,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.blueGrey.shade900,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "+911111111",
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade400,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: ListTile(
                  visualDensity: VisualDensity.compact,
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueGrey.shade900,
                  ),
                  dense: true,
                  title: Center(child: Text("marinovic.karlo@gmail.com")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
