import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/groups/data/repo/group_repo.dart';

import '../../../data/model/video_model.dart';

part 'get_all_videos_state.dart';

class GetAllVideosCubit extends Cubit<GetAllVideosState> {
  GetAllVideosCubit(this._groupRepo) : super(GetAllVideosInitial());
  final GroupRepo _groupRepo;

  void getAllVideos() async {
    emit(GetAllVideosLoading());
    final result = await _groupRepo.getVideos();
    result.fold(
      (failure) => emit(GetAllVideosFailure(failure.errMessage)),
      (videos) => emit(GetAllVideosLoaded(videos)),
    );
  }
}
