import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/core/utils/app_contsants.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';

part 'save_mission_state.dart';

class SaveMissionCubit extends Cubit<SaveMissionState> {
  SaveMissionCubit() : super(SaveMissionInitial());

  void saveMission(Mission mission) {
    emit(SaveMissionLoading());
    final missionsBox = Hive.box<Mission>(AppContsants.missionsBoxKey);

    if (mission.isInBox) {
      mission.save();
      emit(SaveMissionSuccess());
    } else {
      if (mission.tasks.isEmpty && mission.title.isEmpty) {
        emit(AddMissionFailedDueToEmptyTasksAndTitle());
        return;
      }
      missionsBox.add(mission);
      emit(AddMissionSuccess());
    }
  }
}
