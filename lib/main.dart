
import 'package:flutter/material.dart';
import 'package:flutter_labs/screens/info_screen.dart';
import 'package:flutter_labs/screens/task_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/task.dart';
import 'models/worker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<Worker>(WorkerAdapter());
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.initFlutter();
  await Hive.openBox<Worker>("employees");
  await Hive.openBox<Task>("tasks");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyNavBar(),
    );
  }
}



class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    InfoScreen(),
    TaskPage()
  ];

  void onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Workers'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks'
            )
          ],
        ),
    );
  }
}






