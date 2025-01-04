part of 'toggle_task_completed_status_cubit.dart';

sealed class ToggleTaskCompletedStatusState extends Equatable {
  const ToggleTaskCompletedStatusState();

  @override
  List<Object> get props => [];
}

final class ToggleTaskCompletedStatusInitial
    extends ToggleTaskCompletedStatusState {}

final class ToggleTaskCompletedStatusLoading
    extends ToggleTaskCompletedStatusState {}

final class ToggleTaskCompletedStatusSuccess
    extends ToggleTaskCompletedStatusState {}
