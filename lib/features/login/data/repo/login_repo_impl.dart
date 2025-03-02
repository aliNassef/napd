import 'package:dartz/dartz.dart';
import 'package:napd/features/login/data/model/login_input_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/login_remote_source.dart';
import '../../domain/entity/login_input_entity.dart';
import '../../domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteSource _loginRemoteSource;

  LoginRepoImpl({required LoginRemoteSource loginRemoteSource})
      : _loginRemoteSource = loginRemoteSource;
  @override
  Future<Either<Failure, void>> login(LoginInputEntity loginEntity) async {
    try {
      var loginInputModel = LoginInputModel.fromEntity(loginEntity);
      _loginRemoteSource.login(loginInputModel: loginInputModel);

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
