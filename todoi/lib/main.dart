import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoi/models/todo_data.dart';
import 'package:todoi/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final data = "just a simple string for providing";

  @override
  Widget build(BuildContext context) {
    // return Provider<String>(
    //   create: (context) => data,
    // return ChangeNotifierProvider(
    //   create: (context) => Datar(),
    return ChangeNotifierProvider(
      create: (context) => TodoData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

// class Datar extends ChangeNotifier {
//   String data = "dummy initial data by the provider";
//
//   void changeDataVariable(String newString) {
//     data = newString;
//     notifyListeners();
//   }
// }
