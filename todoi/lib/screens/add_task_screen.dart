import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/models/todo_data.dart';

typedef AddTodo = Future<void> Function(Todo);

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
    // required this.addTodo,
  }) : super(key: key);

  // final AddTodo addTodo;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _todoNameController = TextEditingController();

  Future<void> handleAddTodo() async {
    final navigator = Navigator.of(context);

    final text = _todoNameController.text;
    if (text.isEmpty) return;

    try {
      final todo = Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(), name: text);

      // await widget.addTodo(todo);
      Provider.of<TodoData>(context, listen: false).addTodo(todo);
      _todoNameController.clear();
      navigator.pop();
      //  close bottom sheert
      // close keyboard
    } catch (e) {
      print("exception adding new todo: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Add Todo",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            // onChanged: (value) {},
            controller: _todoNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 100.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.all(20.0),
            ),
            onPressed: handleAddTodo,
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          // TextButton(
          //   onPressed: () {
          //     final text = _todoNameController.text;
          //     if (text.isEmpty) return;
          //     Provider.of<Datar>(context, listen: false)
          //         .changeDataVariable(text);
          //   },
          //   child: Text("Change Provider text variable"),
          // ),
        ],
      ),
    );
  }
}
