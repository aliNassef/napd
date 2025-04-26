part of 'article_cubit.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticleFailure extends ArticleState {
  final String errorMessage;
  ArticleFailure({required this.errorMessage});
}

final class ArticleLoaded extends ArticleState {
  final List<ArticleModel> articles;
  ArticleLoaded({required this.articles});
}
