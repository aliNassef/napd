import 'dart:convert';

class TipsAndTricksModel {
  final String title;
  final String imagePath;
  final List<Tip> tips;

  TipsAndTricksModel({
    required this.title,
    required this.imagePath,
    required this.tips,
  });

  factory TipsAndTricksModel.fromJson(Map<String, dynamic> json) {
    return TipsAndTricksModel(
      title: json['Title'] ?? '',
      imagePath: json['ImagePath'] ?? '',
      tips: (json['Tips'] as List<dynamic>?)
              ?.map((tipJson) => Tip.fromJson(tipJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'ImagePath': imagePath,
      'Tips': tips.map((tip) => tip.toJson()).toList(),
    };
  }

  static List<TipsAndTricksModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => TipsAndTricksModel.fromJson(json)).toList();
  }

  static String encode(List<TipsAndTricksModel> models) {
    return json.encode(models.map((model) => model.toJson()).toList());
  }

  static List<TipsAndTricksModel> decode(String modelString) {
    return (json.decode(modelString) as List<dynamic>)
        .map((json) => TipsAndTricksModel.fromJson(json))
        .toList();
  }
}

class Tip {
  final String title;
  final List<TipPoint> points;

  Tip({
    required this.title,
    required this.points,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      title: json['Title'] ?? '',
      points: (json['Points'] as List<dynamic>?)
              ?.map((pointJson) => TipPoint.fromJson(pointJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Points': points.map((point) => point.toJson()).toList(),
    };
  }
}

class TipPoint {
  final String description;

  TipPoint({
    required this.description,
  });

  factory TipPoint.fromJson(Map<String, dynamic> json) {
    return TipPoint(
      description: json['Description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Description': description,
    };
  }
}