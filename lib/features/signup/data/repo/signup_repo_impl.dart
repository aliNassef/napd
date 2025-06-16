import 'package:dartz/dartz.dart';
import 'package:napd/features/signup/data/sources/signup_local_data_source.dart';
import '../model/signup_model.dart';
import 'signup_repo.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

import '../model/signup_input_model.dart';
import '../sources/signup_remote_source.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteSource _signupRemoteSource;
  final SignupLocalDataSource _signupLocalDataSource;

  SignupRepoImpl({
    required SignupRemoteSource signupRemoteSource,
    required SignupLocalDataSource signupLocalDataSource,
  })  : _signupRemoteSource = signupRemoteSource,
        _signupLocalDataSource = signupLocalDataSource;

  @override
  Future<Either<Failure, SignupModel>> signup(
      SignupInputModel signupInputModel) async {
    try {
      final user = await _signupRemoteSource.createAccount(signupInputModel);
      await _signupLocalDataSource.cacheToken(user.token);
      await _signupLocalDataSource.cacheBabyId(user.babies.first.id!);
      return Right(user);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
