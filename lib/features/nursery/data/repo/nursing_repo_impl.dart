import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/nursery/data/models/governorate_model.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo.dart';

import '../source/nursing_remote_datasource.dart';

class NursingRepoImpl extends NursingRepo {
  final NursingRemoteDatasource nursingRemoteDataSource;

  NursingRepoImpl({required this.nursingRemoteDataSource});
  @override
  Future<Either<Failure, List<GovernorateModel>>> getAllGovernorates() async {
    try {
      final goverorates = await nursingRemoteDataSource.getAllGovernates();
      return Right(goverorates);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
