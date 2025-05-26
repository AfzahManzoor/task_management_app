import 'package:flutter/material.dart';
import 'package:task_management_app/model/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isCompleted
                  ? TextDecoration.lineThrough
                  : null, // Strike-through for completed tasks
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        task.isCompleted ? "Completed" : "Pending",
        style: TextStyle(color: task.isCompleted ? Colors.green : Colors.red),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              task.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: task.isCompleted ? Colors.green : Colors.grey,
            ),
            onPressed: onToggle, // Calls toggle function when clicked
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
