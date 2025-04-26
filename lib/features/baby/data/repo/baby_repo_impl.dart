import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';

import 'package:napd/core/errors/failure.dart';

import 'package:napd/features/baby/data/models/baby_model.dart';

import '../source/baby_local_datasource.dart';
import 'baby_repo.dart';

class BabyRepoImpl extends BabyRepo {
  final BabyLocalDatasource localDatasource;

  BabyRepoImpl({required this.localDatasource});
  @override
  Either<Failure, BabyModel> getBaby() {
    try {
      final baby = localDatasource.getSelectedBaby();
      return Right(baby);
    } on CustomException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorMessage,
        ),
      );
    }
  }
}
