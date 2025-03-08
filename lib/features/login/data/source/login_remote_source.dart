import '../../../../core/api/api_consumer.dart';
import '../model/login_input_model.dart';

class LoginRemoteSource {
  final ApiConsumer _api;

  LoginRemoteSource({required ApiConsumer api}) : _api = api;

  Future<void> login({required LoginInputModel loginInputModel}) async {
    _api.get('');
  }
}
