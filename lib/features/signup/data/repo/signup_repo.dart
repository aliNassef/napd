import 'package:dartz/dartz.dart';
import 'package:napd/features/signup/data/model/signup_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class SignupRepo {
  Future<Either<Failure, void>> signup(SignupInputModel signupInputEntity);
}
