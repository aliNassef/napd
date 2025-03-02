import '../../domain/entity/signup_input_entity.dart';

class SignupInputModel {
  final String firstName, lastName, phoneNumber, password, email;
  const SignupInputModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.email,
  });

  factory SignupInputModel.fromEntity(SignupInputEntity entity) {
    return SignupInputModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      phoneNumber: entity.phoneNumber,
      password: entity.password,
      email: entity.email,
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'password': password,
        'email': email,
      };

  factory SignupInputModel.fromJson(Map<String, dynamic> json) {
    return SignupInputModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      email: json['email'],
    );
  }
}
