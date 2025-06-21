part of 'home_search_bloc.dart';

sealed class HomeSearchEvent extends Equatable {
  const HomeSearchEvent();

  @override
  List<Object> get props => [];
}

class HomeOnSearchEvent extends HomeSearchEvent {
  final String query;
  const HomeOnSearchEvent({required this.query});
  @override
  List<Object> get props => [query];
}