part of 'home_search_bloc.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();
  
  @override
  List<Object> get props => [];
}

final class HomeSearchInitial extends HomeSearchState {}
final class HomeSearchLoading extends HomeSearchState {}
final class HomeSearchEmpty extends HomeSearchState {}
final class HomeSearchLoaded extends HomeSearchState {
  final SearchModel searchModel;
  const HomeSearchLoaded({required this.searchModel});
  @override
  List<Object> get props => [searchModel];
}
final class HomeSearchFailure extends HomeSearchState {
  final String errMessage;
  const HomeSearchFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
