import 'package:flutter/material.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/widgets/todo_item.dart';

typedef OnTodoChecked = Future<void> Function(Todo todo);

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final OnTodoChecked onTodoChecked;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (Todo todo in todos)
          TodoItem(
            todo: todo,
            onTodoChecked: onTodoChecked,
          )
      ],
    );
  }
}
