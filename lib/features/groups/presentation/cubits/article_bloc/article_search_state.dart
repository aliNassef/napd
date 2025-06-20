part of 'article_search_bloc.dart';

sealed class ArticleSearchState extends Equatable {
  const ArticleSearchState();

  @override
  List<Object> get props => [];
}

final class ArticleSearchInitial extends ArticleSearchState {}
final class ArticleSearchLoading extends ArticleSearchState {}
final class ArticleSearchLoaded extends ArticleSearchState {
  final List<ArticleModel> articles;
  const ArticleSearchLoaded({required this.articles});
  @override
  List<Object> get props => [articles];
}
final class ArticleSearchFailure extends ArticleSearchState {
  final String errMessage;
  const ArticleSearchFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
