import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/signup_input_entity.dart';

import '../../domain/repo/signup_repo.dart';

part 'sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit(this._signUpRepo) : super(SignUpInitial());
  final SignupRepo _signUpRepo;

  void signup(SignupInputEntity signUpEntity) async {
    emit(SignUpLoading());
    final result = await _signUpRepo.createAccount(signUpEntity);
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
      (success) => emit(SignUpSuccess()),
    );
  }
}
