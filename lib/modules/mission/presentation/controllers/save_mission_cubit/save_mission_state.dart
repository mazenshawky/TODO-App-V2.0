part of 'save_mission_cubit.dart';

sealed class SaveMissionState extends Equatable {
  const SaveMissionState();

  @override
  List<Object> get props => [];
}

final class SaveMissionInitial extends SaveMissionState {}

final class SaveMissionLoading extends SaveMissionState {}

final class SaveMissionSuccess extends SaveMissionState {}

final class AddMissionSuccess extends SaveMissionState {}

final class AddMissionFailedDueToEmptyTasksAndTitle extends SaveMissionState {}
