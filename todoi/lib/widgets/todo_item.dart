import 'package:flutter/material.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/widgets/todo_list.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final OnTodoHandled onTodoChecked;
  final OnTodoHandled onTodoDismissed;

  Future<void> onChanged(bool? checked) async {
    //
    // final updatedTodo = todo..isCompleted = !todo.isCompleted;
    // todo.toggleIsCompleted();
    // await onTodoChecked(updatedTodo);
    await onTodoChecked(todo);
  }

  Future<void> onRemoveTodo(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    //
    // final updatedTodo = todo..isCompleted = !todo.isCompleted;
    // todo.toggleIsCompleted();
    // await onTodoChecked(updatedTodo);
    await onTodoDismissed(todo);
    scaffoldMessenger.showSnackBar(
      const SnackBar(
        content: Text("Dismissed"),
      ),
    );
  }

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChecked,
    required this.onTodoDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) async {
        await onRemoveTodo(context);
      },
      // return GestureDetector(
      //   onLongPress: () async {
      //     await onRemoveTodo(context);
      //   },
      key: Key(todo.id),
      child: CheckboxListTile(
        value: todo.isCompleted,
        onChanged: onChanged,
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        // subtitle: Text("subtitle"),
      ),
    );
  }
}
