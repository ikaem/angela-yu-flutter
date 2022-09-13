import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoi/models/todo.dart';
import 'package:todoi/models/todo_data.dart';
import 'package:todoi/widgets/todo_item.dart';

typedef OnTodoHandled = Future<void> Function(Todo todo);

class TodoList extends StatelessWidget {
  // final List<Todo> todos;
  // final OnTodoChecked onTodoChecked;

  const TodoList({
    Key? key,
    // required this.todos,
    // required this.onTodoChecked,
  }) : super(key: key);

  OnTodoHandled onTodoChecked(BuildContext context) => (Todo todo) async {
        return Provider.of<TodoData>(context, listen: false)
            .checkUncheckTodo(todo);
      };

  OnTodoHandled onTodoDismissed(BuildContext context) => (Todo todo) async {
        return Provider.of<TodoData>(context, listen: false).removeTodo(todo);
      };

  // onTodoChecked(BuildContext context) {
  //   Future<void> handleIt(Todo todo) async {
  //     Provider.of<TodoData>(context).handleTodoChecked(todo);
  //   }
  //
  //   return handleIt(todo);
  // }

  @override
  Widget build(BuildContext context) {
    // final todos = Provider.of<TodoData>(context).todos;

    return Consumer<TodoData>(
      builder: (context, state, child) {
        return ListView.builder(
          itemCount: state.todosCount,
          itemBuilder: (context, index) {
            final todo = state.todos[index];

            return TodoItem(
              todo: todo,
              onTodoChecked: onTodoChecked(context),
              onTodoDismissed: onTodoDismissed(context),
            );
          },
        );
      },
      // child: ,
    );
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
