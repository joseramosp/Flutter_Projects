class Task {
  Task({this.isDone = false, this.name});

  bool isDone;
  String name;

  void toggleDone() {
    isDone = !isDone;
  }
}
