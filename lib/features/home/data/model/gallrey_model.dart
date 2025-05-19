class GallreyModel {
  final String imageUrl;
  final String? description;
  final String createdAt;
  final int id;

  GallreyModel({
    required this.imageUrl,
    this.description,
    required this.createdAt,
    required this.id,
  });

  factory GallreyModel.fromJson(Map<String, dynamic> json) => GallreyModel(
        imageUrl: json['ImageUrl'],
        description: json['Description'],
        createdAt: json['CreatedAt'],
        id: json['Id'],
      );
}
