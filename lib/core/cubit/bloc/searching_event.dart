part of 'searching_bloc.dart';

@immutable
sealed class SearchingEvent {}


final class SearchingEventSearch extends SearchingEvent {
  final String query;
  SearchingEventSearch({required this.query});
}