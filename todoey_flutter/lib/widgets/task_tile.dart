import 'package:flutter/material.dart';

var taskTextStyle = TextStyle(color: Colors.grey[700], fontSize: 16);

class TaskTile extends StatefulWidget {
  TaskTile({this.taskName});

  final String taskName;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskName,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
          isDone: isDone,
          onChanged: (newValue) {
            setState(() {
              isDone = newValue;
            });
          }),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({
    this.isDone,
    this.onChanged,
  });

  final bool isDone;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlue,
      value: isDone,
      onChanged: this.onChanged,
    );
  }
}
