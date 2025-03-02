import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/login/domain/entity/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login(LoginEntity loginEntity);
}
