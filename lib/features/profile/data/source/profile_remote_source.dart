import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/model/profile_model.dart';

abstract class ProfileRemoteSource {
  Future<MotherProfileModel> getProfile();
}

class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteSourceImpl({required this.apiConsumer});
  @override
  Future<MotherProfileModel> getProfile() async {
    final response = await apiConsumer.get(EndPoints.getMotherProfile);
    if (response.statusCode == 200) {
      return MotherProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
