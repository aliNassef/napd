import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:napd/features/parenting_resources/data/repo/parent_recource_repo.dart';

import '../../../data/models/activity_model.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit(this.parentRecourceRepo) : super(ActivityInitial());
  final ParentRecourceRepo parentRecourceRepo;

  void getActivities() async {
    emit(ActivityLoading());
    final result = await parentRecourceRepo.getActivites();
    result.fold(
      (failure) => emit(ActivityFailure(errorMessage: failure.errMessage)),
      (activities) => emit(ActivityLoaded(activities: activities)),
    );
  }
}
