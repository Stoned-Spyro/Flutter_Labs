import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task.dart';
import '../models/worker.dart';

class AssignedUsersScreen extends StatefulWidget {
  final int index;
  const AssignedUsersScreen({
    required this.index,
});

  @override
  State<AssignedUsersScreen> createState() => _AssignedUsersScreenState();
}

class _AssignedUsersScreenState extends State<AssignedUsersScreen> {
  late final workersBox;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    workersBox = Hive.box<Worker>('employees');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose workers to assign them")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("dsada"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('Assign'),
              ),
            ),
          ),
        ],
      )
    );
  }
}
