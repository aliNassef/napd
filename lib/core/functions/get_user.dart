import 'dart:convert';

import '../../features/login/data/model/login_model.dart';
import '../api/end_ponits.dart';
import '../cache/cache_helper.dart';

UserModel? getUser() {
  final userData = CacheHelper().getData(key: ApiKey.userData);
  if (userData != null) {
    final user = json.decode(userData);
    return UserModel.fromJson(user);
  } else {
    return null;
  }
}
