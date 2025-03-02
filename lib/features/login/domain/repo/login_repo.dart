import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/login_input_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login(LoginInputEntity loginEntity);
}
