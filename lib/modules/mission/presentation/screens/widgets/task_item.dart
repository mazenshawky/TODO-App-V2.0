import 'package:flutter/material.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.deleteTask,
    required this.task,
    required this.toggleTaskCompletedStatus,
  });

  final VoidCallback deleteTask;
  final VoidCallback toggleTaskCompletedStatus;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: toggleTaskCompletedStatus,
      trailing: InkWell(
        onTap: deleteTask,
        child: task.isCompleted
            ? Icon(
                Icons.check,
              )
            : Icon(Icons.close, color: AppColors.red),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 22,
          color: task.isCompleted ? AppColors.grey : AppColors.black,
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
