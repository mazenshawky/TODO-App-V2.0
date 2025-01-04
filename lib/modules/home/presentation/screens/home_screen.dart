import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_v2/config/routes/route_names.dart';
import 'package:todo_app_v2/core/utils/app_colors.dart';
import 'package:todo_app_v2/core/utils/dummy.dart';
import 'package:todo_app_v2/modules/home/presentation/controllers/get_missions_cubit/get_missions_cubit.dart';
import 'package:todo_app_v2/modules/home/presentation/screens/widgets/mission_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateToTasksScreen(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.missionRoute);
  }

  @override
  void initState() {
    _getMissions();
    super.initState();
  }

  void _getMissions() {
    BlocProvider.of<GetMissionsCubit>(context).getMissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<GetMissionsCubit, GetMissionsState>(
        builder: (context, state) {
          if (state is GetMissionsSuccess) {
            // final missions = dummyMissions;
            final missions = state.missions;
            return ListView.separated(
                itemBuilder: (context, index) =>
                    MissionItem(mission: missions[index]),
                separatorBuilder: (context, index) => SizedBox(height: 3),
                itemCount: missions.length);
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToTasksScreen(context),
        backgroundColor: AppColors.white,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
