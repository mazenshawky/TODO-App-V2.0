import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  void deleteTask(List<Task> tasks, int index) {
    emit(DeleteTaskLoading());
    tasks.removeAt(index);
    emit(DeleteTaskSuccess());
  }
}
