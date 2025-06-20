import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../../../../core/cache/cache_helper.dart';
import '../models/add_baby_input_model.dart';

abstract class BabyRemoteDatasource {
  Future<BabyModel> getBaby();
  Future<void> updateBabyProfile(AddBabyInputModel addBabyInputModel);
  Future<void> addBaby(AddBabyInputModel addBabyInputModel);
}

class BabyRemoteDatasourceImpl implements BabyRemoteDatasource {
  final ApiConsumer apiConsumer;
  final CacheHelper cacheHelper;
  BabyRemoteDatasourceImpl(
      {required this.apiConsumer, required this.cacheHelper});
  @override
  Future<BabyModel> getBaby() async {
    final response = await apiConsumer.get(
        '${EndPoints.getBabyById}${cacheHelper.getData(key: ApiKey.babyId)}');
    if (response.statusCode == 200) {
      return BabyModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> updateBabyProfile(AddBabyInputModel addBabyInputModel) async {
    final response = await apiConsumer.patch(
      EndPoints.updateBabyProfile,
      data: addBabyInputModel.toJson(),
      isFromData: true,
    );
    if (response.statusCode == 204) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<void> addBaby(AddBabyInputModel addBabyInputModel) async {
    final response = await apiConsumer.post(
      EndPoints.addBaby,
      data: addBabyInputModel.toJson(),
      isFromData: true,
    );
    if (response.statusCode == 201) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
