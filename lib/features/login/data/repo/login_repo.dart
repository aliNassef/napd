import 'package:dartz/dartz.dart';
import '../../../baby/data/models/baby_model.dart';
import '../model/login_input_model.dart';
import '../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, List<BabyModel>>> login(LoginInputModel loginInput);
  Future<Either<Failure, void>> loginWithGoogle();
  Future<Either<Failure, void>> loginWithFacebook();
  Future<void> cacheBabyId(int babyId);
  Future<Either<Failure, void>> sendCodeForResetPassword(String email);
  Future<Either<Failure, void>> resetPassword(String email, String password, String code);

}
