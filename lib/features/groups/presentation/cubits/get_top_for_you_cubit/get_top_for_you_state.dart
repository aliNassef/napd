part of 'get_top_for_you_cubit.dart';

sealed class GetTopForYouState extends Equatable {
  const GetTopForYouState();

  @override
  List<Object> get props => [];
}

final class GetTopForYouInitial extends GetTopForYouState {}

final class GetTopForYouArticlesLoading extends GetTopForYouState {}

final class GetTopForYouArticlesLoaded extends GetTopForYouState {
  final List<ArticleModel> articles;
  const GetTopForYouArticlesLoaded({required this.articles});
}

final class GetTopForYouArticlesFailure extends GetTopForYouState {
  final String errorMessage;
  const GetTopForYouArticlesFailure({required this.errorMessage});
}

final class GetTopForYouPodcastsLoading extends GetTopForYouState {}

final class GetTopForYouPodcastsLoaded extends GetTopForYouState {
  final List<PodcastModel> podcasts;
  const GetTopForYouPodcastsLoaded({required this.podcasts});
}

final class GetTopForYouPodcastsFailure extends GetTopForYouState {
  final String errorMessage;
  const GetTopForYouPodcastsFailure({required this.errorMessage});
}

final class GetTopForYouVideosLoading extends GetTopForYouState {}

final class GetTopForYouVideosLoaded extends GetTopForYouState {
  final List<VideoModel> videos;
  const GetTopForYouVideosLoaded({required this.videos});
}

final class GetTopForYouVideosFailure extends GetTopForYouState {
  final String errorMessage;
  const GetTopForYouVideosFailure({required this.errorMessage});
}
