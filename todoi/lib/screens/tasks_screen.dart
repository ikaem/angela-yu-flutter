import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoi/models/todo_data.dart';
import 'package:todoi/screens/add_task_screen.dart';
import 'package:todoi/widgets/burger_menu.dart';
import 'package:todoi/widgets/todo_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // List<Todo> mockTodos = initialTodos;

  // Future<void> addTodo(Todo todo) async {
  //   // print("todo: $todo");
  //   // setState(() {
  //   //   mockTodos.add(todo);
  //   // });
  // }
  //
  // Future<void> handleCheckTodo(Todo todo) async {
  //   try {
  //     //  takes id of the todo
  //     // final updatedTodos = mockTodos.map<Todo>((t) {
  //     //   final isUpdatedTodo = t.id == todo.id;
  //     //
  //     //   if (isUpdatedTodo) return todo;
  //     //   return t;
  //     // }).toList();
  //     //
  //     // setState(() {
  //     //   mockTodos = updatedTodos;
  //     // });
  //
  //     //TODO this is enough - no need to repalce the whole list
  //     // setState(() {
  //     //   todo.toggleIsCompleted();
  //     // });
  //   } catch (e) {
  //     print("e");
  //   }
  // }

  Future<void> handleShowNewTodoModal() async {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            // padding: EdgeInsets.only(
            //   bottom: MediaQuery.of(context).viewInsets.bottom,
            // ),
            // padding: EdgeInsets.only(bottom: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20).copyWith(
                bottomRight: Radius.zero,
                bottomLeft: Radius.zero,
              ),
            ),
            // child: AddTaskScreen(addTodo: addTodo),
            child: AddTaskScreen(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: handleShowNewTodoModal,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BurgerMenu(),
              SizedBox(
                height: 10,
              ),
              Text(
                "${Provider.of<TodoData>(context).todosCount} tasks",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              // Text(
              //   Provider.of<Datar>(context).data,
              // ),
              SizedBox(
                height: 48,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                        .copyWith(
                            bottomLeft: Radius.zero, bottomRight: Radius.zero),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 30.0),
                    child: TodoList(
                        // todos: Provider.of<TodoData>(context).todos,
                        // onTodoChecked: handleCheckTodo,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
