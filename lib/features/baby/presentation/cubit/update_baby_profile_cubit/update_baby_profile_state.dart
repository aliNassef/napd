part of 'update_baby_profile_cubit.dart';

sealed class UpdateBabyProfileState extends Equatable {
  const UpdateBabyProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateBabyProfileInitial extends UpdateBabyProfileState {}

final class UpdateBabyProfileLoading extends UpdateBabyProfileState {}

final class UpdateBabyProfileSuccess extends UpdateBabyProfileState {}

final class UpdateBabyProfileFailure extends UpdateBabyProfileState {
  final String errMessage;

  const UpdateBabyProfileFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
