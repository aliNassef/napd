class HospitalModel {
  final int? id;
  final String? title;
  final String? description;
  final num? rate;
  final bool? isFavourite;
  final String? imageUrl;
  final String? governorateName;
  final bool? isopended;

  const HospitalModel({
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
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rate: json['rate'],
      isFavourite: json['isFavourite'],
      imageUrl: json['imageUrl'],
      governorateName: json['governorateName'],
      isopended: json['isopended'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'rate': rate,
      'isFavourite': isFavourite,
      'imageUrl': imageUrl,
      'governorateName': governorateName,
      'isopended': isopended,
    };
  }
}
