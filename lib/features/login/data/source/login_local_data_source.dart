import 'dart:convert';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../model/login_model.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheUserData(UserModel user);
  Future<UserModel> getCachedUser();
  Future<void> cacheBabyId(int babyId);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final CacheHelper _cacheHelper;

  LoginLocalDataSourceImpl({
    required CacheHelper cacheHelper,
  }) : _cacheHelper = cacheHelper;
  @override
  Future<void> cacheUserData(UserModel user) async {
    await _cacheHelper.saveData(
      key: ApiKey.userData,
      value: user.toJson(),
    );
  }

  @override
  Future<UserModel> getCachedUser() async {
    final userData = await _cacheHelper.getData(key: ApiKey.userData);
    final user = json.decode(userData);
    return UserModel.fromJson(user);
  }

  @override
  Future<void> cacheBabyId(int babyId) async {
    await _cacheHelper.saveData(key: ApiKey.babyId, value: babyId);
  }
}
