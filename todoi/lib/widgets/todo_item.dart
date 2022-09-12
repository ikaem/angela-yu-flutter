import 'package:flutter/material.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/screens/tasks_screen.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final OnTodoChecked onTodoChecked;

  Future<void> onChanged(bool? checked) async {
    //
    // final updatedTodo = todo..isCompleted = !todo.isCompleted;
    // todo.toggleIsCompleted();
    // await onTodoChecked(updatedTodo);
    await onTodoChecked(todo);
  }

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todo.isCompleted,
      onChanged: onChanged,
      title: Text(
        todo.name,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      // subtitle: Text("subtitle"),
    );
  }
}
