import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/delete_mission_cubit/delete_mission_cubit.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key, required this.mission});

  final Mission mission;
  
  void _deleteMission(BuildContext context) {
    BlocProvider.of<DeleteMissionCubit>(context).deleteMission(mission);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure?', style: TextStyle(fontSize: 20)),
      content: Text(
        'Do you really want to delete this item?',
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: AppColors.grey, fontSize: 16),
          ),
        ),
        TextButton(
          onPressed: () => _deleteMission(context),
          child: Text(
            'Delete',
            style: TextStyle(color: AppColors.red, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
