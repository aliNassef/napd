part of 'article_search_bloc.dart';

sealed class ArticleSearchEvent extends Equatable {
  const ArticleSearchEvent();

  @override
  List<Object> get props => [];
}

final class ArticleOnSearchEvent extends ArticleSearchEvent {
  final String query;
  const ArticleOnSearchEvent({required this.query});
  @override
  List<Object> get props => [query];
}