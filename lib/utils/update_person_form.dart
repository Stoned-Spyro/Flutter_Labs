import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/worker.dart';

class UpdateWorkerForm extends StatefulWidget {
  final int index;
  final Worker worker;

  const UpdateWorkerForm({
    required this.index,
    required this.worker,
  });

  @override
  _UpdateWorkerFormState createState() => _UpdateWorkerFormState();
}

class _UpdateWorkerFormState extends State<UpdateWorkerForm> {
  final _WorkerFormKey = GlobalKey<FormState>();

  late final _nameController;
  late final _specializationController;
  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  // Update info of people box
  _updateInfo() {
    Worker newWorker = Worker(
      name: _nameController.text,
      specialization: _specializationController.text,
    );

    box.putAt(widget.index, newWorker);

    print('Info updated in box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box<Worker>('employees');
    _nameController = TextEditingController(text: widget.worker.name);
    _specializationController = TextEditingController(text: widget.worker.specialization);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _WorkerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 24.0),
          const Text('Specialization'),
          TextFormField(
            controller: _specializationController,
            validator: _fieldValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_WorkerFormKey.currentState!.validate()) {
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}