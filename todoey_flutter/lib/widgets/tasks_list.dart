import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.all(30),
          itemBuilder: (context, index) {
            return TaskTile(
              taskName: taskData.tasks[index].name,
              isDone: taskData.tasks[index].isDone,
              checkboxCallback: (checkboxStatus) {
                taskData.changeTaskStatus(index);
              },
              deleteTaskCallback: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
