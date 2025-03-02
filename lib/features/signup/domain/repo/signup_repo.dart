import 'package:dartz/dartz.dart';
import '../entity/signup_input_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class SignupRepo {
  Future<Either<Failure, void>> createAccount(SignupInputEntity signupInputEntity);
}
