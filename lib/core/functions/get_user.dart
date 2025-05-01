import 'dart:convert';

import '../../features/baby/data/models/baby_model.dart';
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

int? getBabyId() {
  final babyId = CacheHelper().getData(key: ApiKey.babyId);
  if (babyId != null) {
    return babyId;
  } else {
    return null;
  }
}

BabyModel? getBaby() {
  final user = getUser();
  final babies = user?.babies;
  for (var baby in babies ?? []) {
    if (baby.id == getBabyId()) {
      return baby;
    }
  }
  return null;
}
