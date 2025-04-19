import 'package:napd/core/models/baby_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String token;
  final List<BabyModel> babies;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.babies,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
      babies:
          (json['babies'] as List).map((e) => BabyModel.fromJson(e)).toList(),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
      'babies': babies.map((e) => e.toJson()).toList(),
      'imageUrl': imageUrl,
    };
  }
}
