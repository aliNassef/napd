import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/functions/upload_image_to_api.dart';
import '../model/signup_input_model.dart';
import '../model/signup_model.dart';

abstract class SignupRemoteSource {
  Future<SignupModel> createAccount(SignupInputModel signupInputModel);
}

class SignupRemoteSourceImpl implements SignupRemoteSource {
  final ApiConsumer _apiConsumer;

  const SignupRemoteSourceImpl(this._apiConsumer);
  @override
  Future<SignupModel> createAccount(SignupInputModel signupInputModel) async {
    final image = await uploadImageToAPI(signupInputModel.file!);
    final response = await _apiConsumer.post(
      EndPoints.register,
      data: {
        'files': [image],
        'email': signupInputModel.email,
        'password': signupInputModel.password,
        'firstName': signupInputModel.firstName,
        'lastName': signupInputModel.lastName,
        'babyName': signupInputModel.babyName,
        'birthDate': signupInputModel.birthDate,
        'gender': signupInputModel.gender,
      },
      isFromData: true,
    );
    if (response.statusCode == 200) {
      return SignupModel.fromJson(response.data);
    } else {
      throw ServerException(
        ErrorModel.fromJson(response.data),
      );
    }
  }
}
