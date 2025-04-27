import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../login/data/model/login_model.dart';
import '../model/signup_model.dart';
import 'dart:convert';

abstract class SignupLocalDataSource {
  Future<void> cacheUserData(SignupModel user);
  Future<UserModel> getCachedUser();
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
