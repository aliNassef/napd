import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../models/governorate_model.dart';
import '../models/hospital_model.dart';
import 'nursing_repo.dart';

import '../source/nursing_remote_datasource.dart';

class NursingRepoImpl extends NursingRepo {
  final NursingRemoteDatasource nursingRemoteDataSource;

  NursingRepoImpl({required this.nursingRemoteDataSource});
  @override
  Future<Either<Failure, List<GovernorateModel>>> getAllGovernorates() async {
    try {
      final goverorates = await nursingRemoteDataSource.getAllGovernorates();
      return Right(goverorates);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<HospitalModel>>> getAllHospitals() async {
    try {
      final hospitals = await nursingRemoteDataSource.getAllHospitals();
      return Right(hospitals);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<HospitalModel>>> getFilterdHospitals(
    int id,
  ) async {
    try {
      final hospitals = await nursingRemoteDataSource.getFilterdHospitals(id);
      return Right(hospitals);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addHospitalToFav(int id) async {
    return _toggleFavoriteHospital(
      nursingRemoteDataSource.addHospitalToFavorites(id),
    );
  }

  @override
  Future<Either<Failure, void>> delHospitalFromFav(int id) async {
    return _toggleFavoriteHospital(
      nursingRemoteDataSource.delHospitalFromFavorites(id),
    );
  }

  Future<Either<Failure, void>> _toggleFavoriteHospital(
    Future<void> addOrDelete,
  ) async {
    try {
      await addOrDelete;
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(errMessage: e.toString()),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<HospitalModel>>> searchOnHospitals(String query) async {
    try {
      final hospitals = await nursingRemoteDataSource.searchOnHospitals(query);
      return Right(hospitals);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
