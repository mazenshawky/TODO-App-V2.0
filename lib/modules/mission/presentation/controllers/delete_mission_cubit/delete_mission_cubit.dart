import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';

part 'delete_mission_state.dart';

class DeleteMissionCubit extends Cubit<DeleteMissionState> {
  DeleteMissionCubit() : super(DeleteMissionInitial());

  void deleteMission(Mission mission) {
    emit(DeleteMissionLoading());
    mission.delete();
    emit(DeleteMissionSuccess());
  }
}
