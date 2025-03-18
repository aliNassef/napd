import '../../domain/entity/login_input_entity.dart';

class LoginInputModel {
  final String email;
  final String password;

  LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginInputModel.fromEntity(LoginInputEntity entity) {
    return LoginInputModel(
      email: entity.email,
      password: entity.pass,
    );
  }

  factory LoginInputModel.fromJson(Map<String, dynamic> json) {
    return LoginInputModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
