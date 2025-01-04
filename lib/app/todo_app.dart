import 'package:flutter/material.dart';
import 'package:todo_app_v2/core/utils/app_fonts.dart';
import 'package:todo_app_v2/modules/tasks/presentation/screens/tasks_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: FontConstants.poppinsFontFamily,
        useMaterial3: true,
      ),
      home: const TasksScreen(),
    );
  }
}
