import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/cache/cache_helper.dart';
import 'package:napd/features/login/data/model/login_model.dart';

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
      value: user.toJson().toString(),
    );
  }

  @override
  Future<UserModel> getCachedUser() async {
    return UserModel.fromJson(await _cacheHelper.getData(key: ApiKey.userData));
  }

  @override
  Future<void> cacheBabyId(int babyId) async {
    _cacheHelper.saveData(key: ApiKey.babyId, value: babyId);
  }
}
