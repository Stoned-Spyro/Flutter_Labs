import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject{

  @HiveField(0)
  String description;
  @HiveField(1)
  bool isDone;

  Task({
    required this.description,
    this.isDone = false,
  });
}