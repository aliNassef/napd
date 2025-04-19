class BabyModel {
  final int? id;
  final String? babyName;
  final String? birthDate;
  final int? height;
  final int? weight;
  final String? profilePicUrl;
  final int? age;
  final int? gender;
  final bool? isActive;
  final dynamic memoriesPicsUrls;
  final int? motherId;
  final dynamic reminders;

  BabyModel({
    this.id,
    this.babyName,
    this.birthDate,
    this.height,
    this.weight,
    this.profilePicUrl,
    this.age,
    this.gender,
    this.isActive,
    this.memoriesPicsUrls,
    this.motherId,
    this.reminders,
  });

  factory BabyModel.fromJson(Map<String, dynamic> json) {
    return BabyModel(
      id: json['id'],
      babyName: json['babyName'],
      birthDate: json['birthDate'],
      height: json['height'],
      weight: json['weight'],
      profilePicUrl: json['profilePicUrl'],
      age: json['age'],
      gender: json['gender'],
      isActive: json['isActive'],
      memoriesPicsUrls: json['memoriesPicsUrls'],
      motherId: json['motherId'],
      reminders: json['reminders'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'babyName': babyName,
      'birthDate': birthDate,
      'height': height,
      'weight': weight,
      'profilePicUrl': profilePicUrl,
      'age': age,
      'gender': gender,
      'isActive': isActive,
      'memoriesPicsUrls': memoriesPicsUrls,
      'motherId': motherId,
      'reminders': reminders,
    };
  }
}
