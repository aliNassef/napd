import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../core/cache/cache_helper.dart';
import '../models/add_baby_input_model.dart';
import '../models/cry_model.dart';

abstract class BabyRemoteDatasource {
  Future<BabyModel> getBaby();
  Future<void> updateBabyProfile(AddBabyInputModel addBabyInputModel);
  Future<void> addBaby(AddBabyInputModel addBabyInputModel);
  Future<CryModel> detectAudio(String filePath);
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
    if (response.statusCode == 204) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CryModel> detectAudio(String filePath) async {
    final dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(
      filePath,
      filename: 'recording.wav',
      contentType: MediaType('audio', 'wav'),
    ),
  });
    dio.options.headers = {
      'accept': 'application/json',
    };
    final response = await dio.post(
      'https://xzaaam-cry.hf.space/predict',
      data: formData,
    );

    if (response.statusCode == 200) {
      return CryModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
