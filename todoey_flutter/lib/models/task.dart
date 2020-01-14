import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Task with ChangeNotifier {
  Task({this.id, this.timestamp, this.isDone = false, this.name});

  int id = Random.secure().nextInt(10000);
  bool isDone;
  String name;
  var timestamp = DateTime.now().toString();

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone ? 1 : 0,
      'timestamp': timestamp,
    };
  }
}
