import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter city name",
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide.none),
);
