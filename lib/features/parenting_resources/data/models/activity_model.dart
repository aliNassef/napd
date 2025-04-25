class ActivityModel {
  final String title;
  final String content;
  final String imageUrl;

  ActivityModel({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
    };
  }
}
