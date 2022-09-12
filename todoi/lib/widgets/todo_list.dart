import 'package:flutter/material.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/screens/tasks_screen.dart';
import 'package:todoi/widgets/todo_item.dart';

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
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return TodoItem(todo: todo, onTodoChecked: onTodoChecked);
        });
    // return ListView(
    //   children: <Widget>[
    //     for (Todo todo in mockTodos)
    //       TodoItem(
    //         todo: todo,
    //         onTodoChecked: handleCheckTodo,
    //       )
    //   ],
    // );
  }
}
