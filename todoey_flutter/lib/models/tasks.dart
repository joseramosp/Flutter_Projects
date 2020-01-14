import 'package:flutter/material.dart';
import 'task.dart';
import 'package:todoey_flutter/database/tasks_database.dart';
import 'dart:async';

class Tasks with ChangeNotifier {
  final TaskDatabase tasksDatabase = TaskDatabase();

  List<Task> tasks;

  Tasks() {
    tasks = [];
    getTasksFromDatabase();
  }

  void addTask(String taskName) async {
    Task newTask = Task(name: taskName);
    tasks.add(newTask);
    await tasksDatabase.insertTask(newTask);
    notifyListeners();
  }

  void changeTaskStatus(index) {
    tasks[index].toggleDone();
    tasksDatabase.updateTask(tasks[index]);
    notifyListeners();
  }

  void deleteTask(index) {
    tasksDatabase.deleteTask(tasks[index]);
    tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount {
    return tasks.length ?? 0;
  }

  void getTasksFromDatabase() async {
    tasks = await tasksDatabase.tasksList();
    notifyListeners();
  }
}
