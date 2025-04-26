part of 'activity_cubit.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class ActivityLoading extends ActivityState {}

final class ActivityLoaded extends ActivityState {
  final List<ActivityModel> activities;

  ActivityLoaded({required this.activities});
}

final class ActivityFailure extends ActivityState {
  final String errorMessage;

  ActivityFailure({required this.errorMessage});
}
