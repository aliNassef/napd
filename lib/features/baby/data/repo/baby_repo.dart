import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';

import '../models/baby_model.dart';

abstract class BabyRepo {
  Future<Either<Failure, BabyModel>> getBaby();
}
