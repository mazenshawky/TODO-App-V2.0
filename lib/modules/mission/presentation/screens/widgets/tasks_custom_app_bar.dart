import 'package:flutter/material.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/widgets/mission_title_textfield.dart';

class TasksCustomAppBar extends StatelessWidget {
  const TasksCustomAppBar({
    super.key,
    required this.selectedColorIndex,
    required this.missionTitleController,
    required this.showColorPickerDialog,
    required this.showDeleteConfirmationDialog,
    required this.showDeleteMissionButton,
  });

  final int selectedColorIndex;
  final TextEditingController missionTitleController;
  final VoidCallback showColorPickerDialog;
  final VoidCallback showDeleteConfirmationDialog;
  final bool showDeleteMissionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.taskAppBarColors[selectedColorIndex],
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: MissionTitleTextField(missionTitleController),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: showColorPickerDialog,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.missionPrimaryColors[selectedColorIndex],
                border: Border.all(width: 1),
              ),
            ),
          ),
          SizedBox(width: 20),
          if (showDeleteMissionButton)
            InkWell(
              onTap: showDeleteConfirmationDialog,
              child: Icon(Icons.delete),
            ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
