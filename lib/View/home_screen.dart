import 'package:flutter/material.dart';
import 'package:task_management_app/Controller/task_controller.dart';
import 'package:task_management_app/View/add_task_screen.dart';
import 'package:task_management_app/Widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = TaskController();

  @override
  void initState() {
    super.initState();
    _taskController.loadTasks().then((_) {
      if (mounted) setState(() {});
    });
  }

  void _openAddTaskScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddTaskScreen(
              onTaskAdded: (title, subtitle) {
                _taskController.addTask(title, subtitle);
                setState(() {});
              },
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "Organize your tasks efficiently",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _taskController.tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: TaskTile(
                task: _taskController.tasks[index],
                onDelete: () {
                  _taskController.removeTask(index);
                  setState(() {});
                },
                onToggle: () {
                  _taskController.toggleTaskCompletion(index);
                  setState(() {});
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskScreen,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
