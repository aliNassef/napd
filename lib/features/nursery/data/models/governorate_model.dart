class GovernorateModel {
  final num governorateId;
  final String governorateName;

  GovernorateModel({
    required this.governorateId,
    required this.governorateName,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'governorateId': governorateId,
      'governorateName': governorateName,
    };
  }
}
