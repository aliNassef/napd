import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';

import '../../../../core/api/end_ponits.dart';
import '../models/governorate_model.dart';
import '../models/hospital_model.dart';

abstract class NursingRemoteDatasource {
  Future<List<HospitalModel>> getAllHospitals();
  Future<void> getSpecificHospital();
  Future<List<GovernorateModel>> getAllGovernates();
  Future<List<HospitalModel>> getFilterdHospitals(int id);
  Future<void> addHospitalToFavorites();
  Future<void> getFavoritesHospitals();
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
  Future<void> getSpecificHospital() async {
    throw UnimplementedError();
  }

  @override
  Future<void> addHospitalToFavorites() async {
    throw UnimplementedError();
  }

  @override
  Future<void> getFavoritesHospitals() async {
    throw UnimplementedError();
  }
}
