part of 'hospital_search_bloc.dart';

sealed class HospitalSearchEvent extends Equatable {
  const HospitalSearchEvent();

  @override
  List<Object> get props => [];
}

final class HospitalOnSearchEvent extends HospitalSearchEvent {
  final String query;

  const HospitalOnSearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}