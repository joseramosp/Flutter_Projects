import 'package:flutter/material.dart';
import 'task.dart';

class Tasks with ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Do a commit'),
    Task(name: 'Make mi first million dollars'),
    Task(name: 'Study Flutter'),
    Task(name: 'Test'),
  ];

  void addTask(String taskName) {
    tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void changeTaskStatus(index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount {
    return tasks.length;
  }
}
