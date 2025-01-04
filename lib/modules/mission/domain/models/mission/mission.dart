import 'package:hive/hive.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

part 'mission.g.dart';

@HiveType(typeId: 0)
class Mission extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String date;
  @HiveField(2)
  String time;
  @HiveField(3)
  int colorIndex;
  @HiveField(4)
  final List<Task> tasks;

  Mission({
    required this.title,
    required this.date,
    required this.time,
    required this.colorIndex,
    required this.tasks,
  });
}
