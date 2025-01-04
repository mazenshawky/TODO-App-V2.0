import 'package:flutter/material.dart';
import 'package:todo_app_v2/config/routes/app_router.dart';
import 'package:todo_app_v2/core/utils/app_fonts.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontConstants.poppinsFontFamily,
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
