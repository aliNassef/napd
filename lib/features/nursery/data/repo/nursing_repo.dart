import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/nursery/data/models/governorate_model.dart';
import '../models/hospital_model.dart';

abstract class NursingRepo {
  Future<Either<Failure, List<GovernorateModel>>> getAllGovernorates();
  Future<Either<Failure, List<HospitalModel>>> getAllHospitals();
  Future<Either<Failure, List<HospitalModel>>> getFilterdHospitals(int id);
  Future<Either<Failure, void>> addHospitalToFav(int id);
  Future<Either<Failure, void>> delHospitalFromFav(int id);
}
