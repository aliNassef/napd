import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';

import '../../../../core/model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, MotherProfileModel>> getProfile();
}
