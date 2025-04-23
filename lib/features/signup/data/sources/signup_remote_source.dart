import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../model/signup_input_model.dart';

abstract class SignupRemoteSource {
  Future<void> createAccount(SignupInputModel signupInputModel);
}

class SignupRemoteSourceImpl implements SignupRemoteSource {
  final ApiConsumer _apiConsumer;

  const SignupRemoteSourceImpl(this._apiConsumer);
  @override
  Future<void> createAccount(SignupInputModel signupInputModel) async {
    final response = await _apiConsumer.post(
      EndPoints.register,
      data: signupInputModel.toJson(),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
