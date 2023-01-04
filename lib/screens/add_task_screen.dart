import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/add_task_form.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AddTaskForm(),
      ),
    );
  }
}