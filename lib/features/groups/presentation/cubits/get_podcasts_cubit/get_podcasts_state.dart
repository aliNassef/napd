part of 'get_podcasts_cubit.dart';

sealed class GetPodcastsState extends Equatable {
  const GetPodcastsState();

  @override
  List<Object> get props => [];
}

final class GetPodcastsInitial extends GetPodcastsState {}

final class GetPodcastsLoading extends GetPodcastsState {}

final class GetPodcastsLoaded extends GetPodcastsState {
  final List<PodcastModel> podcasts;

  const GetPodcastsLoaded({required this.podcasts});

  @override
  List<Object> get props => [podcasts];
}

final class GetPodcastsFailure extends GetPodcastsState {
  final String errMessage;
  const GetPodcastsFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
