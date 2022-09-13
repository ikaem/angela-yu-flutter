import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoi/models/todo.dart';

final List<Todo> initialTodos = [
  Todo(id: "id1", name: "name1", isCompleted: false),
  Todo(id: "id2", name: "name2", isCompleted: false),
  Todo(id: "id3", name: "name3", isCompleted: true),
];

class TodoData extends ChangeNotifier {
  List<Todo> _todos = initialTodos;

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  Future<void> checkUncheckTodo(Todo todo) async {
    todo.toggleIsCompleted();
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  //TODO testing
  void removeTodo(Todo todo) {
    _todos = todos.where((t) {
      return t != todo;
    }).toList();

    notifyListeners();
  }

  int get todosCount => todos.length;
}
