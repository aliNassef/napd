import 'package:napd/core/api/api_consumer.dart';

class LoginRemoteSource {
  final ApiConsumer _api;

  LoginRemoteSource({required ApiConsumer api}) : _api = api;

  void login({required String email, required String pass}) {}
}
