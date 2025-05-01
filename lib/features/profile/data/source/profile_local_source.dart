import 'package:napd/core/cache/cache_helper.dart';
import 'package:napd/core/errors/exceptions.dart';

abstract class ProfileLocalSource {
  Future<void> logout();
}

class ProfileLocalSourceImpl extends ProfileLocalSource {
  final CacheHelper cacheHelper;

  ProfileLocalSourceImpl({required this.cacheHelper});
  @override
  Future<void> logout() async {
    try {
      await cacheHelper.clearData();
    } catch (e) {
      throw CustomException(
        errorMessage: 'Failed to logout',
      );
    }
  }
}
