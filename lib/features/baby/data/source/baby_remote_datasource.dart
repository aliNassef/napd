import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../../../../core/cache/cache_helper.dart';

abstract class BabyRemoteDatasource {
  Future<BabyModel> getBaby();
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
}
