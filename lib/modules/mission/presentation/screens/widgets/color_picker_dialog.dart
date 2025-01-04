import 'package:flutter/material.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({super.key, required this.selectedColorIndex});

  final int selectedColorIndex;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose a Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: AppColors.missionPrimaryColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.missionPrimaryColors[index],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: index == selectedColorIndex
                            ? AppColors.black
                            : AppColors.grey,
                        width: index == selectedColorIndex ? 4.0 : 2.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
