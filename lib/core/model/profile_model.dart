class MotherProfileModel {
  final String name;
  final String email;
  final String image;

  const MotherProfileModel({
    required this.name,
    required this.email,
    required this.image,
  });

  factory MotherProfileModel.fromJson(Map<String, dynamic> json) {
    return MotherProfileModel(
      name: json['FullName'] as String,
      email: json['Email'] as String,
      image: json['ImageUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'FullName': name,
      'Email': email,
      'ImageUrl': image,
    };
  }
}
