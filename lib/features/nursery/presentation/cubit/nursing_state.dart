import '../../data/models/governorate_model.dart';

final class NursingState {}

final class NursingIntial extends NursingState {}

final class NursingLoading extends NursingState {}

final class NursingLoaded extends NursingState {}

final class NursingFailure extends NursingState {
  final String errMessage;

  NursingFailure(this.errMessage);
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
