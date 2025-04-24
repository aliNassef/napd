import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/api/end_ponits.dart';
import '../models/governorate_model.dart';
import '../models/hospital_model.dart';

abstract class NursingRemoteDatasource {
  Future<List<HospitalModel>> getAllHospitals();
  Future<List<GovernorateModel>> getAllGovernates();
  Future<List<HospitalModel>> getFilterdHospitals(int id);
  Future<void> addHospitalToFavorites(int id);
  Future<void> delHospitalFromFavorites(int id);
}

class NursingRemoteDatasourceImpl implements NursingRemoteDatasource {
  final ApiConsumer _apiConsumer;

  NursingRemoteDatasourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<List<GovernorateModel>> getAllGovernates() async {
    final response = await _apiConsumer.get(
      EndPoints.getAllGovernorates,
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => GovernorateModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HospitalModel>> getAllHospitals() async {
    final response = await _apiConsumer.get(
      EndPoints.getAllHospital,
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => HospitalModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HospitalModel>> getFilterdHospitals(int id) async {
    final response = await _apiConsumer.get(
      '${EndPoints.filterHospitalById}$id',
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => HospitalModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> addHospitalToFavorites(id) async {
    final response = await _apiConsumer.post(
      '${EndPoints.addHospitlaToFav}$id',
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> delHospitalFromFavorites(int id) async {
    final response = await _apiConsumer.delete(
      '${EndPoints.delFavoriteHospital}$id',
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
