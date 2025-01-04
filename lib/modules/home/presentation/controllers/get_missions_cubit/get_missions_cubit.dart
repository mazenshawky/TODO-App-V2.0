import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/core/utils/app_contsants.dart';
import 'package:todo_app_v2/modules/mission/domain/models/mission/mission.dart';

part 'get_missions_state.dart';

class GetMissionsCubit extends Cubit<GetMissionsState> {
  GetMissionsCubit() : super(GetMissionsInitial());

  void getMissions() {
    emit(GetMissionsLoading());
    var missionsBox = Hive.box<Mission>(AppContsants.missionsBoxKey);
    final List<Mission> missions =
        missionsBox.values.toList().reversed.toList();
    emit(GetMissionsSuccess(missions: missions));
  }
}
