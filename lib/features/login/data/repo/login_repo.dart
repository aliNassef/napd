import 'package:dartz/dartz.dart';
import 'package:napd/core/models/baby_model.dart';
import 'package:napd/features/login/data/model/login_input_model.dart';
import '../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, List<BabyModel>>> login(LoginInputModel loginEntity);
  Future<Either<Failure, void>> loginWithGoogle();
  Future<Either<Failure, void>> loginWithFacebook();
  Future<void> cacheBabyId(int babyId);
}
