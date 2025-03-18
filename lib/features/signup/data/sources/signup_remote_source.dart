import '../model/signup_input_model.dart';

import '../../../../core/api/api_consumer.dart';

class SignupRemoteSource {
  final ApiConsumer api;

  SignupRemoteSource({required this.api});

  Future<void> createAccount(SignupInputModel signupInputModel) async {
    // api.post();
  }
}
