import 'package:flutter/material.dart';
import 'package:todo_app_v2/config/routes/route_names.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';

class MissionItem extends StatelessWidget {
  const MissionItem({super.key, required this.mission});

  final Mission mission;

  void _navigateToTasksScreen(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.missionRoute, arguments: mission);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _navigateToTasksScreen(context),
      title: Text(
        mission.title,
        style: TextStyle(fontSize: 25),
      ),
      minTileHeight: 80,
      trailing: Column(
        children: [
          Text(
            mission.date,
            style: TextStyle(
              fontSize: 19,
              color: AppColors.grey,
            ),
          ),
          Text(
            mission.time,
            style: TextStyle(
              fontSize: 19,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      tileColor: AppColors.missionSecondaryColors[mission.colorIndex],
    );
  }
}
