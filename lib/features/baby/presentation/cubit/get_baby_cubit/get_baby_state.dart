part of 'get_baby_cubit.dart';

@immutable
sealed class GetBabyState {}

final class GetBabyInitial extends GetBabyState {}

final class GetBabyLoading extends GetBabyState {}

final class GetBabyFailure extends GetBabyState {
  final String errorMessage;

  GetBabyFailure({required this.errorMessage});
}

final class GetBabyLoaded extends GetBabyState {
  final BabyModel baby;
  GetBabyLoaded({required this.baby});
}
