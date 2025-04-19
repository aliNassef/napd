import '../../../../core/api/end_ponits.dart';

class LoginInputModel {
  final String email;
  final String password;

  LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      ApiKey.email: email,
      ApiKey.password: password,
    };
  }

  factory LoginInputModel.fromJson(Map<String, dynamic> json) {
    return LoginInputModel(
      email: json[ApiKey.email],
      password: json[ApiKey.password],
    );
  }
}
