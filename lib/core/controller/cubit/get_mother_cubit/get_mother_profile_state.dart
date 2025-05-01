part of 'get_mother_profile_cubit.dart';

sealed class GetMotherProfileState extends Equatable {
  const GetMotherProfileState();

  @override
  List<Object> get props => [];
}

final class GetMotherProfileInitial extends GetMotherProfileState {}

final class GetMotherProfileLoading extends GetMotherProfileState {}

final class GetMotherProfileLoaded extends GetMotherProfileState {
  final MotherProfileModel profileModel;

  const GetMotherProfileLoaded({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

final class GetMotherProfileFailure extends GetMotherProfileState {
  final String errorMessage;

  const GetMotherProfileFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetMotherProfileLogout extends GetMotherProfileState {
  const GetMotherProfileLogout();

  @override
  List<Object> get props => [];
}
