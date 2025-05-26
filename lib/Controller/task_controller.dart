import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/model/task_model.dart';

class TaskController {
  List<Task> tasks = [];

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? taskData = prefs.getString('tasks');
    if (taskData != null) {
      tasks =
          (json.decode(taskData) as List)
              .map((task) => Task.fromJson(task))
              .toList();
    }
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json.encode(tasks));
  }

  void addTask(String title, String subtitle) {
    tasks.add(Task(title: title, subtitle: subtitle));
    saveTasks();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    saveTasks();
  }
}
