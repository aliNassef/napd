import 'package:equatable/equatable.dart';

import '../../data/models/governorate_model.dart';
import '../../data/models/hospital_model.dart';

final class NursingState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NursingIntial extends NursingState {
  @override
  List<Object?> get props => [];
}

final class HospitalsLoading extends NursingState {}

final class HospitalsLoaded extends NursingState {
  final List<HospitalModel> hospitals;

  HospitalsLoaded({required this.hospitals});
  @override
  List<Object?> get props => [hospitals];
}

final class HospitalsFailure extends NursingState {
  final String errMessage;

  HospitalsFailure(this.errMessage);
  @override
  List<Object?> get props => [errMessage];
}

final class GovernateLoaded extends NursingState {
  final List<GovernorateModel> governorates;

  GovernateLoaded({required this.governorates});
  @override
  List<Object?> get props => [governorates];
}

final class GovernateLoading extends NursingState {
  @override
  List<Object?> get props => [];
}

final class GovernateFailure extends NursingState {
  final String errMessage;

  GovernateFailure(this.errMessage);
  @override
  List<Object?> get props => [errMessage];
}

final class ToggleFavoriteLoading extends NursingState {
  final int id;

  ToggleFavoriteLoading({required this.id});
  @override
  List<Object?> get props => [id];
}

final class ToggleFavoriteLoaded extends NursingState {
  final int id;

  ToggleFavoriteLoaded({required this.id});
  @override
  List<Object?> get props => [];
}

final class ToggleFavoriteFailure extends NursingState {
  final String errMessage;

  ToggleFavoriteFailure(this.errMessage);
  @override
  List<Object?> get props => [errMessage];
}
