class BabyModel {
  final int? id;
  final String? babyName;
  final String? birthDate;

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
      babyName: json['BabyName'],
      birthDate: json['BirthDate'],
      profilePicUrl: json['ProfilePicUrl'],
      age: json['Age'],
      gender: json['gender'],
      isActive: json['IsActive'],
      memoriesPicsUrls: json['MemoriesPicsUrls'],
      motherId: json['motherId'],
      reminders: json['Reminders'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'BabyName': babyName,
      'BirthDate': birthDate,
      'ProfilePicUrl': profilePicUrl,
      'Age': age,
      'gender': gender,
      'IsActive': isActive,
      'MemoriesPicsUrls': memoriesPicsUrls,
      'motherId': motherId,
      'Reminders': reminders,
    };
  }
}
