import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoi/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final data = "just a simple string for providing";

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => data,
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
