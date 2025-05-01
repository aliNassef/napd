import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../source/baby_remote_datasource.dart';
import 'baby_repo.dart';

class BabyRepoImpl extends BabyRepo {
  final BabyRemoteDatasource remoteDatasource;

  BabyRepoImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, BabyModel>> getBaby() async {
    try {
      final baby = await remoteDatasource.getBaby();
      return Right(baby);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
