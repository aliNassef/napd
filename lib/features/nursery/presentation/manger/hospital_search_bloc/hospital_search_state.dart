part of 'hospital_search_bloc.dart';

sealed class HospitalSearchState extends Equatable {
  const HospitalSearchState();
  
  @override
  List<Object> get props => [];
}

final class HospitalSearchInitial extends HospitalSearchState {}
final class HospitalSearchLoading extends HospitalSearchState {}
final class HospitalSearchEmpty extends HospitalSearchState {}
final class HospitalSearchLoaded extends HospitalSearchState {
  final List<HospitalModel> hospitals;

  const HospitalSearchLoaded({required this.hospitals});

  @override
  List<Object> get props => [hospitals];
}
final class HospitalSearchFailure extends HospitalSearchState {
  final String errMessage;

  const HospitalSearchFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
