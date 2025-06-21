class CryModel {
  final String cry;
  final num confidence;

  CryModel({
    required this.cry,
    required this.confidence,
  });

  factory CryModel.fromJson(Map<String, dynamic> json) {
    return CryModel(
      cry: json['prediction'],
      confidence: json['confidence'],
    );
  }
}
