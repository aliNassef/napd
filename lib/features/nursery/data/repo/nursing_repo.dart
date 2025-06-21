import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/governorate_model.dart';
import '../models/hospital_model.dart';

abstract class NursingRepo {
  Future<Either<Failure, List<GovernorateModel>>> getAllGovernorates();
  Future<Either<Failure, List<HospitalModel>>> getAllHospitals();
  Future<Either<Failure, List<HospitalModel>>> getFilterdHospitals(int id);
  Future<Either<Failure, void>> addHospitalToFav(int id);
  Future<Either<Failure, void>> delHospitalFromFav(int id);
  Future<Either<Failure, List<HospitalModel>>> searchOnHospitals(String query);
}
