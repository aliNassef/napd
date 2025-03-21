import '../../../../core/api/api_consumer.dart';
import '../model/login_input_model.dart';

abstract class LoginRemoteSource {
  Future<void> login({required LoginInputModel loginInputModel});
}

class LoginRemoteSourceImpl extends LoginRemoteSource {
  final ApiConsumer api;

  LoginRemoteSourceImpl({required this.api});
  @override
  Future<void> login({required LoginInputModel loginInputModel}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
