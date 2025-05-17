class PodcastModel {
  final String title;
  final String type ;
  final String duration;
  final String url;
  PodcastModel({required this.title,required this.type,required this.duration,required this.url,});

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      title: json['Title'] as String,
      type: json['Type'] as String,
      duration: json['Duration'] as String,
      url: json['URL'] as String,
    );
  }
} 