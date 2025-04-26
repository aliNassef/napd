class ArticleModel {
  final String title;
  final String description;
  final int views;
  final String createdAt;
  final String imageUrl;

  ArticleModel({
    required this.title,
    required this.description,
    required this.views,
    required this.createdAt,
    required this.imageUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['Title'] as String,
      description: json['Description'] as String,
      views: json['Views'] as int,
      createdAt: json['CreatedAt'] as String,
      imageUrl: json['ImageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Description': description,
      'Views': views,
      'CreatedAt': createdAt,
      'ImageUrl': imageUrl,
    };
  }
}
