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

final class SendCodeSuccessState extends LoginState {}

final class SendCodeLoadingState extends LoginState {}

final class SendCodeFailureState extends LoginState {
  final String errMessage;

  SendCodeFailureState({required this.errMessage});
}

final class ResetPasswordSuccessState extends LoginState {}

final class ResetPasswordLoadingState extends LoginState {}

final class ResetPasswordFailureState extends LoginState {
  final String errMessage;

  ResetPasswordFailureState({required this.errMessage});
}
