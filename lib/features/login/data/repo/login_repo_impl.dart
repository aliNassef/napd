import 'package:dartz/dartz.dart';
import 'package:napd/features/login/data/model/login_input_model.dart';
import 'package:napd/features/login/data/source/login_local_data_source.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/models/baby_model.dart';
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
      await _loginLocalSource.cacheUserData(user);
      return right(user.babies);
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> cacheBabyId(int babyId) async {
    await _loginLocalSource.cacheBabyId(babyId);
  }
}
