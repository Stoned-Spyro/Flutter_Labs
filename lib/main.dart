
import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/info_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/task.dart';
import 'models/worker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Worker>(WorkerAdapter());
  //Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Worker>("employees");
 // await Hive.openBox<Task>("tasks");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoScreen(),
    );
  }
}


