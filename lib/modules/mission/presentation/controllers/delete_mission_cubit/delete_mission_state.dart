part of 'delete_mission_cubit.dart';

sealed class DeleteMissionState extends Equatable {
  const DeleteMissionState();

  @override
  List<Object> get props => [];
}

final class DeleteMissionInitial extends DeleteMissionState {}

final class DeleteMissionLoading extends DeleteMissionState {}

final class DeleteMissionSuccess extends DeleteMissionState {}
