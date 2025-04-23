class GovernorateModel {
  final num governorateId;
  final String governorateName;

  GovernorateModel({
    required this.governorateId,
    required this.governorateName,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      governorateId: json['GovernorateId'],
      governorateName: json['GovernorateName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'GovernorateId': governorateId,
      'GovernorateName': governorateName,
    };
  }
}
