part of 'get_missions_cubit.dart';

sealed class GetMissionsState extends Equatable {
  const GetMissionsState();

  @override
  List<Object> get props => [];
}

final class GetMissionsInitial extends GetMissionsState {}

final class GetMissionsLoading extends GetMissionsState {}

final class GetMissionsSuccess extends GetMissionsState {
  final List<Mission> missions;

  const GetMissionsSuccess({required this.missions});
}
