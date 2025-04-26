import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../model/signup_model.dart';
import 'dart:convert';

abstract class SignupLocalDataSource {
  Future<void> cacheUserData(SignupModel user);
  Future<SignupModel> getCachedUser();
  Future<void> cacheBabyId(int babyId);
}

class SignupLocalDataSourceImpl implements SignupLocalDataSource {
  final CacheHelper _cacheHelper;

  SignupLocalDataSourceImpl({required CacheHelper cacheHelper})
      : _cacheHelper = cacheHelper;

  @override
  Future<void> cacheUserData(SignupModel user) async {
    await _cacheHelper.saveData(
      key: ApiKey.userData,
      value: user.toJson().toString(),
    );
  }

  @override
  Future<SignupModel> getCachedUser() async {
    final cachedData = await _cacheHelper.getData(key: ApiKey.userData);

    if (cachedData == null) {
      throw Exception('No cached user data found');
    }

    return SignupModel.fromJson(
      Map<String, dynamic>.from(
        cachedData is String ? _convertStringToJson(cachedData) : cachedData,
      ),
    );
  }

  @override
  Future<void> cacheBabyId(int babyId) async {
    await _cacheHelper.saveData(
      key: ApiKey.babyId,
      value: babyId,
    );
  }

  Map<String, dynamic> _convertStringToJson(String jsonString) {
    return jsonString.isNotEmpty
        ? Map<String, dynamic>.from(json.decode(jsonString))
        : {};
  }
}
