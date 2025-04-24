import 'package:dio/dio.dart';

class SignupInputModel {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final bool? isMarried;
  final String? address;
  final String? motherImage;
  final String? babyName;
  final String? birthDate;
  final int? gender;
  final String? babyImage;
  final MultipartFile? file;

  SignupInputModel({
    this.firstName,
    this.lastName,
    this.isMarried,
    this.address,
    this.motherImage,
    this.babyName,
    this.birthDate,
    this.gender,
    this.babyImage,
    this.email,
    this.password,
    this.file,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (firstName != null) data['firstName'] = firstName;
    if (lastName != null) data['lastName'] = lastName;
    if (isMarried != null) data['isMarried'] = isMarried;
    if (address != null) data['address'] = address;
    if (motherImage != null) data['motherImage'] = motherImage;
    if (babyName != null) data['babyName'] = babyName;
    if (birthDate != null) data['birthDate'] = birthDate;
    if (gender != null) data['gender'] = gender.toString();
    if (babyImage != null) data['babyImage'] = babyImage;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (file != null) data['file'] = [file];
    return data;
  }

  factory SignupInputModel.fromJson(Map<String, dynamic> json) {
    return SignupInputModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      isMarried: json['isMarried'],
      address: json['address'],
      motherImage: json['motherImage'],
      babyName: json['babyName'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      babyImage: json['babyImage'],
      email: json['email'],
      password: json['password'],
    );
  }
}
