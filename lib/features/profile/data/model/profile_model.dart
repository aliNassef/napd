class ProfileModel {
  final String name;
  final String email;
  final String image;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['FullName'] as String,
      email: json['Email'] as String,
      image: json['image'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'FullName': name,
      'Email': email,
      'image': image,
    };
  }
}
