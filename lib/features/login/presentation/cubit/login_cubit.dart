import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/login_input_model.dart';

import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;

  void login(LoginInputModel loginEntity) async {
    emit(LoginLoading());
    final userOrFaliure = await _loginRepo.login(loginEntity);
    userOrFaliure.fold(
      (error) => emit(
        LoginFailure(errMessage: error.errMessage),
      ),
      (success) => emit(
        LoginSuccess(
          babies: success,
        ),
      ),
    );
  }

  void signInWithGoogle() async {}

  Future<void> signInWithFacebook() async {}

  Future<void> selectBabyId(int babyId) async {
    await _loginRepo.cacheBabyId(babyId);
    emit(
      SelectBabyScuccess(message: 'Success Login'),
    );
  }

  void sendCode({required String email}) async {
    emit(SendCodeLoadingState());
    final senCodeOrFaliure = await _loginRepo.sendCodeForResetPassword(email);
    senCodeOrFaliure.fold(
      (failure) => emit(
        SendCodeFailureState(errMessage: failure.errMessage),
      ),
      (success) => emit(
        SendCodeSuccessState(),
      ),
    );
  }

  void resetPassword({
    required String email,
    required String password,
    required String code,
  }) async {
    emit(ResetPasswordLoadingState());
    final resetPasswordOrFailure = await _loginRepo.resetPassword(
      email,
      password,
      code,
    );
    resetPasswordOrFailure.fold(
      (failure) => emit(
        ResetPasswordFailureState(errMessage: failure.errMessage),
      ),
      (success) => emit(
        ResetPasswordSuccessState(),
      ),
    );
  }
}
