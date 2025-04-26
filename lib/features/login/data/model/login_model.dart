import '../../../../core/models/baby_model.dart';

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
      id: json['Id'],
      name: json['Name'],
      email: json['Email'],
      token: json['Token'],
      babies:
          (json['Babies'] as List).map((e) => BabyModel.fromJson(e)).toList(),
      imageUrl: json['ImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Email': email,
      'Token': token,
      'Babies': babies.map((e) => e.toJson()).toList(),
      'ImageUrl': imageUrl,
    };
  }
}
