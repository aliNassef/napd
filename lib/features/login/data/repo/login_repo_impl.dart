import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/login/data/source/login_remote_source.dart';
import 'package:napd/features/login/domain/entity/login_entity.dart';
import 'package:napd/features/login/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteSource _loginRemoteSource;

  LoginRepoImpl({required LoginRemoteSource loginRemoteSource})
      : _loginRemoteSource = loginRemoteSource;
  @override
  Future<Either<Failure, void>> login(LoginEntity loginEntity) async {
    try {
      _loginRemoteSource.login(
        email: loginEntity.email,
        pass: loginEntity.pass,
      );

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
