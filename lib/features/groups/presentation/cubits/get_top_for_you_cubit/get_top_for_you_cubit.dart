import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/article_model.dart';
import '../../../data/model/podcast_model.dart';
import '../../../data/model/video_model.dart';
import '../../../data/repo/group_repo.dart';

part 'get_top_for_you_state.dart';

class GetTopForYouCubit extends Cubit<GetTopForYouState> {
  GetTopForYouCubit(this.groupRepo) : super(GetTopForYouInitial());
  final GroupRepo groupRepo;

  void getTopArticles() async{
    emit(GetTopForYouArticlesLoading());
    final result = await groupRepo.getTop4Articles();
    result.fold(
      (failure) => emit(GetTopForYouArticlesFailure(errorMessage: failure.errMessage)),
      (articles) => emit(GetTopForYouArticlesLoaded(articles: articles)),
    );
  }

  void getTopPodcasts() async{
    emit(GetTopForYouPodcastsLoading());
    final result = await groupRepo.getTop4Podcasts();
    result.fold(
      (failure) => emit(GetTopForYouPodcastsFailure(errorMessage: failure.errMessage)),
      (podcasts) => emit(GetTopForYouPodcastsLoaded(podcasts: podcasts)),
    );
  }

  void getTopVideos() async{
    emit(GetTopForYouVideosLoading());
    final result = await groupRepo.getTop4Videos();
    result.fold(
      (failure) => emit(GetTopForYouVideosFailure(errorMessage: failure.errMessage)),
      (videos) => emit(GetTopForYouVideosLoaded(videos: videos)),
    );
  }
}
