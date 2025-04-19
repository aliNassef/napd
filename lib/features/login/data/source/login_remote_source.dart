import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/error_model.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/login/data/model/login_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/firebase_auth_service.dart';
import '../model/login_input_model.dart';

abstract class LoginRemoteSource {
  Future<UserModel> login({required LoginInputModel loginInputModel});
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
}

class LoginRemoteSourceImpl extends LoginRemoteSource {
  final ApiConsumer api;
  final FirebaseAuthService firebaseAuthService;
  LoginRemoteSourceImpl({required this.api, required this.firebaseAuthService});
  @override
  Future<UserModel> login({required LoginInputModel loginInputModel}) async {
    final response =
        await api.post(EndPoints.login, data: loginInputModel.toJson());
    try {
      return UserModel.fromJson(response);
    } catch (e) {
      throw ServerException(
        ErrorModel.fromJson(response),
      );
    }
  }

  @override
  Future<void> loginWithGoogle() async {
    await firebaseAuthService.signInWithGoogle();
  }

  @override
  Future<void> loginWithFacebook() async {
    await firebaseAuthService.signInWithFacebook();
  }
}
