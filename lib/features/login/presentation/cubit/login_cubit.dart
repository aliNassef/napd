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
}
