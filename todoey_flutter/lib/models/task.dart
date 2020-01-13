import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  Task({this.isDone = false, this.name});

  bool isDone;
  String name;

  void toggleDone() {
    isDone = !isDone;
  }
}
