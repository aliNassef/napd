import '../../../baby/data/models/baby_model.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class LoginSuccess extends LoginState {
  final List<BabyModel> babies;

  LoginSuccess({required this.babies});
}

final class SelectBabyScuccess extends LoginState {
  final String message;

  SelectBabyScuccess({required this.message});
}
