import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/worker.dart';

class AddWorkerForm extends StatefulWidget {
  const AddWorkerForm({Key? key}) : super(key: key);

  @override
  _AddWorkerFormState createState() => _AddWorkerFormState();
}

class _AddWorkerFormState extends State<AddWorkerForm> {
  final _nameController = TextEditingController();
  final _specializationController = TextEditingController();
  final _WorkerFormKey = GlobalKey<FormState>();

  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  // Add info to people box
  _addInfo() async {
    Worker newWorker = Worker(
      name: _nameController.text,
      specialization: _specializationController.text,
    );

    box.add(newWorker);
    print('Info added to box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box<Worker>('employees');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _WorkerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Specialization'),
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
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}