import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/config/routes/route_names.dart';
import 'package:todo_app_v2/modules/home/presentation/controllers/get_missions_cubit/get_missions_cubit.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';
import 'package:todo_app_v2/modules/home/presentation/screens/home_screen.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/save_mission_cubit/save_mission_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/toggle_task_completed_status_cubit/toggle_task_completed_status_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/mission_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.homeRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetMissionsCubit(),
            child: HomeScreen(),
          ),
        );

      case RouteNames.missionRoute:
        final mission = routeSettings.arguments as Mission?;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddTaskCubit(),
              ),
              BlocProvider(
                create: (context) => SaveMissionCubit(),
              ),
              BlocProvider(
                create: (context) => DeleteTaskCubit(),
              ),
              BlocProvider(
                create: (context) => ToggleTaskCompletedStatusCubit(),
              ),
            ],
            child: MissionScreen(mission: mission),
          ),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No Route Found!'),
        ),
      ),
    );
  }
}
