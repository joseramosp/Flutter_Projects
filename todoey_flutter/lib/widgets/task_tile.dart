import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.taskName, this.isDone});
  final String taskName;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(color: Colors.grey[700], fontSize: 16),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isDone,
      ),
    );
  }
}
