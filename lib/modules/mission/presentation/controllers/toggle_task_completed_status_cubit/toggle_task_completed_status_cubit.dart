import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

part 'toggle_task_completed_status_state.dart';

class ToggleTaskCompletedStatusCubit
    extends Cubit<ToggleTaskCompletedStatusState> {
  ToggleTaskCompletedStatusCubit() : super(ToggleTaskCompletedStatusInitial());

  void toggleTaskCompletedStatus(List<Task> tasks, int index) {
    emit(ToggleTaskCompletedStatusLoading());
    tasks[index].isCompleted = !tasks[index].isCompleted;
    emit(ToggleTaskCompletedStatusSuccess());
  }
}
