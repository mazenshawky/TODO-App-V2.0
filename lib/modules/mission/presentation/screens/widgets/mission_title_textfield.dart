import 'package:flutter/material.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';

class MissionTitleTextField extends StatelessWidget {
  const MissionTitleTextField(this.missionTitleController, {super.key});

  final TextEditingController missionTitleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        autofocus: missionTitleController.text.isEmpty ? true : false,
        controller: missionTitleController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.orange, width: 2),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
