import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entity/signup_input_entity.dart';
import '../../domain/repo/signup_repo.dart';

import '../model/signup_input_model.dart';
import '../sources/signup_remote_source.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteSource _signupRemoteSource;

  SignupRepoImpl({required SignupRemoteSource signupRemoteSource})
      : _signupRemoteSource = signupRemoteSource;
  @override
  Future<Either<Failure, void>> createAccount(
      SignupInputEntity signupInputEntity) async {
    try {
      var signupInputModel = SignupInputModel.fromEntity(signupInputEntity);
      await _signupRemoteSource.createAccount(signupInputModel);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
