part of 'get_all_videos_cubit.dart';

sealed class GetAllVideosState extends Equatable {
  const GetAllVideosState();

  @override
  List<Object> get props => [];
}

final class GetAllVideosInitial extends GetAllVideosState {}
final class GetAllVideosLoading extends GetAllVideosState {}
final class GetAllVideosLoaded extends GetAllVideosState {
  final List<VideoModel> videos;
  const GetAllVideosLoaded(this.videos);
    @override
  List<Object> get props => [videos];
}
final class GetAllVideosFailure extends GetAllVideosState {
  final String errMessage;
  const GetAllVideosFailure(this.errMessage);
    @override
  List<Object> get props => [errMessage];
}

