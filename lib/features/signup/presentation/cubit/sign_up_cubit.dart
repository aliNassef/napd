import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/signup/data/model/signup_input_model.dart';

import '../../data/repo/signup_repo.dart';
 
part 'sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit(this._signUpRepo) : super(SignUpInitial());
  final SignupRepo _signUpRepo;

  void signup(SignupInputModel signupInputModel) async {
    emit(SignUpLoading());
    final result = await _signUpRepo.signup(signupInputModel);
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
      (success) => emit(SignUpSuccess()),
    );
  }
}
