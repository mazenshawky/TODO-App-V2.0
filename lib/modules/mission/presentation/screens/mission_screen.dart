import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app_v2/config/routes/route_names.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/core/utils/helpers.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/delete_task_cubit/delete_task_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/delete_mission_cubit/delete_mission_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/save_mission_cubit/save_mission_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/controllers/toggle_task_completed_status_cubit/toggle_task_completed_status_cubit.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/widgets/color_picker_dialog.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/widgets/delete_confirmation_dialog.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/widgets/task_item.dart';
import 'package:todo_app_v2/modules/mission/presentation/screens/widgets/tasks_custom_app_bar.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key, required this.mission});

  final Mission? mission;

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  late int _selectedColorIndex;

  final missionTitleController = TextEditingController();

  late Mission myMession;

  @override
  void initState() {
    if (widget.mission == null) {
      myMession = Mission(
        title: '',
        date: Helpers.getCurrentDate(),
        time: Helpers.getCurrentTime(),
        colorIndex: 0,
        tasks: [],
      );
    } else {
      missionTitleController.text = widget.mission!.title;
      myMession = widget.mission!;
    }
    _selectedColorIndex = myMession.colorIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.missionSecondaryColors[_selectedColorIndex],
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            return;
          }
          _saveMission();
        },
        child: SafeArea(
          child: BlocBuilder<AddTaskCubit, AddTaskState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return BlocBuilder<ToggleTaskCompletedStatusCubit,
                  ToggleTaskCompletedStatusState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return BlocBuilder<DeleteTaskCubit, DeleteTaskState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      return Column(
                        children: [
                          TasksCustomAppBar(
                            selectedColorIndex: _selectedColorIndex,
                            missionTitleController: missionTitleController,
                            showColorPickerDialog: _showColorPickerDialog,
                            showDeleteConfirmationDialog:
                                _showDeleteConfirmationDialog,
                            showDeleteMissionButton: widget.mission != null ||
                                missionTitleController.text.isNotEmpty ||
                                myMession.tasks.isNotEmpty,
                          ),
                          ListTile(
                            onTap: _showAddTaskDialog,
                            leading: Icon(Icons.add_circle_outlined),
                            title: Text(
                              'Add Item',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => TaskItem(
                                deleteTask: () => _deleteTask(index),
                                task: myMession.tasks[index],
                                toggleTaskCompletedStatus: () =>
                                    _toggleTaskCompletedStatus(
                                        myMession.tasks, index),
                              ),
                              separatorBuilder: (context, index) => Divider(
                                thickness: 0.5,
                                color: AppColors.grey,
                              ),
                              itemCount: myMession.tasks.length,
                            ),
                          ),
                          BlocListener<SaveMissionCubit, SaveMissionState>(
                            listenWhen: (previous, current) =>
                                previous != current,
                            listener: (context, state) {
                              if (state is SaveMissionSuccess) {
                                Fluttertoast.showToast(
                                    msg: 'Saved Successfully!');
                                _navigateBackToHomeScreen();
                              } else if (state is AddMissionSuccess) {
                                Fluttertoast.showToast(
                                    msg: 'Added Successfully!');
                                _navigateBackToHomeScreen();
                              } else if (state
                                  is AddMissionFailedDueToEmptyTasksAndTitle) {
                                Navigator.of(context).pop();
                              }
                            },
                            child: SizedBox(),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showColorPickerDialog() async {
    _selectedColorIndex = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ColorPickerDialog(selectedColorIndex: _selectedColorIndex);
      },
    );
    setState(() {});
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => DeleteMissionCubit(),
          child: BlocListener<DeleteMissionCubit, DeleteMissionState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is DeleteMissionSuccess) {
                Fluttertoast.showToast(msg: 'Deleted Successfully!');
                _navigateBackToHomeScreen();
              }
            },
            child: DeleteConfirmationDialog(mission: myMession),
          ),
        );
      },
    );
  }

  void _showAddTaskDialog() async {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: taskController,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addTask(taskController.text);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    BlocProvider.of<DeleteTaskCubit>(context)
        .deleteTask(myMession.tasks, index);
  }

  void _addTask(String taskTitle) {
    BlocProvider.of<AddTaskCubit>(context).addTask(myMession.tasks, taskTitle);
  }

  void _saveMission() {
    myMession.title = missionTitleController.text;
    myMession.colorIndex = _selectedColorIndex;
    myMession.date = Helpers.getCurrentDate();
    myMession.time = Helpers.getCurrentTime();
    if (myMession.title.isEmpty && myMession.tasks.isNotEmpty) {
      myMession.title = '(${Helpers.getCurrentDate()})';
    }
    BlocProvider.of<SaveMissionCubit>(context).saveMission(myMession);
  }

  void _navigateBackToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.homeRoute, ModalRoute.withName('home'));
  }

  void _toggleTaskCompletedStatus(List<Task> tasks, int index) {
    BlocProvider.of<ToggleTaskCompletedStatusCubit>(context)
        .toggleTaskCompletedStatus(tasks, index);
  }
}
