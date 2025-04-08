import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/firebase_auth_service.dart';
import '../model/login_input_model.dart';

abstract class LoginRemoteSource {
  Future<void> login({required LoginInputModel loginInputModel});
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
}

class LoginRemoteSourceImpl extends LoginRemoteSource {
  final ApiConsumer api;
  final FirebaseAuthService firebaseAuthService;
  LoginRemoteSourceImpl({required this.api, required this.firebaseAuthService});
  @override
  Future<void> login({required LoginInputModel loginInputModel}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
  
  @override
  Future<void> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }
}
