import 'package:flutter/material.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        TaskTile(
          taskName: 'Go to sleep',
          isDone: true,
        ),
        TaskTile(
          taskName: 'Study Flutter',
          isDone: true,
        ),
      ],
    );
  }
}
