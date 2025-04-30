import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/login_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/firebase_auth_service.dart';
import '../model/login_input_model.dart';

abstract class LoginRemoteSource {
  Future<UserModel> login({required LoginInputModel loginInputModel});
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
  Future<void> sendCode(String email);
  Future<void> resetPassword(String email, String password, String code);
}

class LoginRemoteSourceImpl extends LoginRemoteSource {
  final ApiConsumer api;
  final FirebaseAuthService firebaseAuthService;
  LoginRemoteSourceImpl({required this.api, required this.firebaseAuthService});
  @override
  Future<UserModel> login({required LoginInputModel loginInputModel}) async {
    final response =
        await api.post(EndPoints.login, data: loginInputModel.toJson());
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
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

  @override
  Future<void> sendCode(String email) async {
    final response = await api.post(
      EndPoints.forgetPassword,
      data: {
        'email': email,
      },
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> resetPassword(String email, String password, String code) async {
    final response = await api.post(
      EndPoints.resetPassword,
      data: {
        'email': email,
        'newPassword': password,
        'code': code,
      },
    );
    if (response.statusCode != 200) {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
