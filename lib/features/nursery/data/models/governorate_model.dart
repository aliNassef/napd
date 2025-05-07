import 'package:equatable/equatable.dart';

class GovernorateModel extends Equatable {
  final num governorateId;
  final String governorateName;

  const GovernorateModel({
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

  @override
  List<Object?> get props => [
        governorateId,
        governorateName,
      ];
}
