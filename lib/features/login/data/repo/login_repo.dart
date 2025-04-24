import 'package:dartz/dartz.dart';
import '../../../../core/models/baby_model.dart';
import '../model/login_input_model.dart';
import '../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, List<BabyModel>>> login(LoginInputModel loginEntity);
  Future<Either<Failure, void>> loginWithGoogle();
  Future<Either<Failure, void>> loginWithFacebook();
  Future<void> cacheBabyId(int babyId);
}
