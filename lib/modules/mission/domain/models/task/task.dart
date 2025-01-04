import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isCompleted;

  Task({
    required this.title,
    required this.isCompleted,
  });
}
