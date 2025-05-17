import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/podcast_model.dart';
import '../../../data/repo/group_repo.dart';

part 'get_podcasts_state.dart';

class GetPodcastsCubit extends Cubit<GetPodcastsState> {
  GetPodcastsCubit(this._groupRepo) : super(GetPodcastsInitial());
  final GroupRepo _groupRepo;

  void getPodcasts() async {
    emit(GetPodcastsLoading());
    final podcastsOrfailure = await _groupRepo.getPodcasts();
    podcastsOrfailure.fold(
      (failure) => emit(GetPodcastsFailure(failure.errMessage)),
      (podcasts) => emit(GetPodcastsLoaded(podcasts: podcasts)),
    );
  }
}
