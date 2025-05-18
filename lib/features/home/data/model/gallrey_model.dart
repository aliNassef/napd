class GallreyModel {
  final String imageUrl;
  final String? description;
  final String createdAt;

  GallreyModel(
      {required this.imageUrl,
      this.description,
      required this.createdAt});

  factory GallreyModel.fromJson(Map<String, dynamic> json) => GallreyModel(
        imageUrl: json['ImageUrl'],
        description: json['Description'],
        createdAt: json['CreatedAt'],
      );
}

