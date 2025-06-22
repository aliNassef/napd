import 'package:image_picker/image_picker.dart';

class AddBabyInputModel {
  final String? name;
  final String? age;
  final int? gender;
  final XFile? image;
  AddBabyInputModel({
    this.name,
    this.age,
    this.gender,
    this.image,
  });

  factory AddBabyInputModel.fromJson(json) {
    return AddBabyInputModel(
      name: json['BabyName'],
      age: json['BirthDate'],
      gender: json['Gender'],
      image: json['BabyImage'] as XFile,
    );
  }

  toJson() => {
        'BabyName': name,
        'BirthDate': age,
        'Gender': gender,
        'BabyImage': image,
      };
}
