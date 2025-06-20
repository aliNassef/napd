import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/baby/data/models/add_baby_input_model.dart';

import '../models/baby_model.dart';

abstract class BabyRepo {
  Future<Either<Failure, BabyModel>> getBaby();
  Future<Either<Failure, void>> updateBabyProfile(AddBabyInputModel addBabyInputModel);
  Future<Either<Failure, void>> addBaby(AddBabyInputModel addBabyInputModel);
}
