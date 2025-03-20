import '../model/signup_input_model.dart';

abstract class SignupRemoteSource {
  Future<void> createAccount(SignupInputModel signupInputModel);
}

class SignupRemoteSourceImpl implements SignupRemoteSource {
  @override
  Future<void> createAccount(SignupInputModel signupInputModel) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }
}
