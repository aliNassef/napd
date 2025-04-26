import '../../../baby/data/models/baby_model.dart';

class SignupModel {
  int id;
  String name;
  String email;
  String token;
  List<BabyModel> babies;
  String imageUrl;

  SignupModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.babies,
    required this.imageUrl,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
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
