import 'package:dartz/dartz.dart';
import '../model/signup_input_model.dart';
import '../model/signup_model.dart';

import '../../../../core/errors/failure.dart';

abstract class SignupRepo {
  Future<Either<Failure, SignupModel>> signup(
      SignupInputModel signupInputModel);
}
