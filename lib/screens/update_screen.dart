

import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/update_person_form.dart';

import '../models/worker.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  final Worker worker;

  const UpdateScreen({
    required this.index,
    required this.worker,
  });

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdateWorkerForm(
          index: widget.index,
          worker: widget.worker,
        ),
      ),
    );
  }
}