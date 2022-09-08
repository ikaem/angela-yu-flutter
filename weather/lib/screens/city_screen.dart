import 'package:flutter/material.dart';
import 'package:weather/styles/constants.dart';

class CityScreen extends StatefulWidget {
  CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/city_background.jpg"),
              fit: BoxFit.cover),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: const Text("Get Weather"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
