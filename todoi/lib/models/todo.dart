class Todo {
  late String id;
  late String name;
  late bool isCompleted;

  Todo({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });

  void toggleIsCompleted() {
    isCompleted = !isCompleted;
  }
}
