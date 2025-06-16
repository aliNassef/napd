import 'package:dartz/dartz.dart';
import '../model/login_input_model.dart';
import '../source/login_local_data_source.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../baby/data/models/baby_model.dart';
import '../source/login_remote_source.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteSource _loginRemoteSource;
  final LoginLocalDataSource _loginLocalSource;

  LoginRepoImpl(
      {required LoginRemoteSource loginRemoteSource,
      required LoginLocalDataSource loginLocalSource})
      : _loginRemoteSource = loginRemoteSource,
        _loginLocalSource = loginLocalSource;

  @override
  Future<Either<Failure, List<BabyModel>>> login(
      LoginInputModel loginInput) async {
    try {
      final user = await _loginRemoteSource.login(loginInputModel: loginInput);
      await _loginLocalSource.cacheToken(user.token);
      return right(user.babies);
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> loginWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheBabyId(int babyId) async {
    await _loginLocalSource.cacheBabyId(babyId);
  }

  @override
  Future<Either<Failure, void>> sendCodeForResetPassword(String email) async {
    try {
      await _loginRemoteSource.sendCode(email);
      return right(null);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
      String email, String password, String code) async {
    try {
      await _loginRemoteSource.resetPassword(email, password, code);
      return right(null);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
