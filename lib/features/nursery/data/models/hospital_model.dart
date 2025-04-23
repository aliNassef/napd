class HospitalModel {
  final int? id;
  final String? title;
  final String? description;
  final num? rate;
  bool? isFavourite;
  final String? imageUrl;
  final String? governorateName;
  final bool? isopended;

  HospitalModel({
    this.id,
    this.title,
    this.description,
    this.rate,
    this.isFavourite,
    this.imageUrl,
    this.governorateName,
    this.isopended,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['Id'],
      title: json['Title'],
      description: json['Description'],
      rate: json['rate'],
      isFavourite: json['IsFavourite'],
      imageUrl: json['ImageUrl'],
      governorateName: json['governorateName'],
      isopended: json['isopended'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'Description': description,
      'rate': rate,
      'IsFavourite': isFavourite,
      'ImageUrl': imageUrl,
      'governorateName': governorateName,
      'isopended': isopended,
    };
  }
}
