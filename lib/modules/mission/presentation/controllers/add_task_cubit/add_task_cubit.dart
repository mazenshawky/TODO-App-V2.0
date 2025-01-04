import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_v2/modules/mission/domain/models/task/task.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  void addTask(List<Task> tasks, String taskTitle) {
    emit(AddTaskLoading());
    tasks.add(Task(title: taskTitle, isCompleted: false));
    emit(AddTaskSuccess());
  }
}
