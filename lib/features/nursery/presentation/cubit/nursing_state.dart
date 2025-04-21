import '../../data/models/governorate_model.dart';
import '../../data/models/hospital_model.dart';

final class NursingState {}

final class NursingIntial extends NursingState {}

final class HospitalsLoading extends NursingState {}

final class HospitalsLoaded extends NursingState {
  final List<HospitalModel> hospitals;

  HospitalsLoaded({required this.hospitals});
}

final class HospitalsFailure extends NursingState {
  final String errMessage;

  HospitalsFailure(this.errMessage);
}

final class GovernateLoaded extends NursingState {
  final List<GovernorateModel> governorates;

  GovernateLoaded({required this.governorates});
}

final class GovernateLoading extends NursingState {}

final class GovernateFailure extends NursingState {
  final String errMessage;

  GovernateFailure(this.errMessage);
}
