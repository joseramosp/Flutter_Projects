import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function checkboxCallback;
  final Function deleteTaskCallback;

  TaskTile(
      {this.taskName,
      this.isDone,
      this.checkboxCallback,
      this.deleteTaskCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTaskCallback,
      title: Text(
        taskName,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isDone,
        onChanged: checkboxCallback,
      ),
    );
  }
}
