import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/login/domain/entity/login_entity.dart';

import '../../domain/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;

  void login(LoginEntity loginEntity) async {
    final res = await _loginRepo.login(loginEntity);
    res.fold(
      (error) => emit(
        LoginFailure(errMessage: error.errMessage),
      ),
      (success) => emit(
        LoginSuccess(),
      ),
    );
  }
}
