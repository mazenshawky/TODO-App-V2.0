import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/app/bloc_observer.dart';
import 'package:todo_app_v2/app/todo_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/core/utils/app_contsants.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(MissionAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Mission>(AppContsants.missionsBoxKey);

  runApp(const ToDoApp());
}
