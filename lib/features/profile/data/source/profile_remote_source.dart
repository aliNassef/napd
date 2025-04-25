import '../model/profile_model.dart';

abstract class ProfileRemoteSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteSourceImpl implements ProfileRemoteSource {
  @override
  Future<ProfileModel> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
}
