import 'package:dartz/dartz.dart';
import 'package:napd/features/signup/data/repo/signup_repo.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

import '../model/signup_input_model.dart';
import '../sources/signup_remote_source.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteSource _signupRemoteSource;

  SignupRepoImpl({required SignupRemoteSource signupRemoteSource})
      : _signupRemoteSource = signupRemoteSource;

  @override
  Future<Either<Failure, void>> signup(
      SignupInputModel signupInputModel) async {
    try {
      await _signupRemoteSource.createAccount(signupInputModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
