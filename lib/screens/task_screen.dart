import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/add_task_screen.dart';
import 'package:flutter_labs/screens/save_assigned_users_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  late final Box contactBox;

  // Delete info from people box
  _deleteInfo(int index) {
    contactBox.deleteAt(index);

    print('Item deleted from box at index: $index');
  }
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    contactBox = Hive.box<Task>('tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks info")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddTaskScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body:  ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var taskData = currentBox.getAt(index)!;

                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AssignedUsersScreen(
                        index: index
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(taskData.description),
                    subtitle: Text(taskData.assignedToWorkers ?? "None"),
                    trailing: IconButton(
                      onPressed: () => _deleteInfo(index),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
