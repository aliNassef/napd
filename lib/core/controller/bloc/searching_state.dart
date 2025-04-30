part of 'searching_bloc.dart';

@immutable
sealed class SearchingState {}

final class SearchingInitial extends SearchingState {}

final class SearchingLoading extends SearchingState {}

final class SearchingFailure extends SearchingState {
  final String errMessage;

  SearchingFailure({required this.errMessage});
}

final class SearchingLoaded extends SearchingState {}
