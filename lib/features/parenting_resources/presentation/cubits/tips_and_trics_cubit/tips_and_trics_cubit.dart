import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/tips_trics_model.dart';
import '../../../data/repo/parent_recource_repo.dart';

part 'tips_and_trics_state.dart';

class TipsAndTricsCubit extends Cubit<TipsAndTricsState> {
  final ParentRecourceRepo parentRecourceRepo;
  TipsAndTricsCubit({required this.parentRecourceRepo})
      : super(TipsAndTricsIntial());

  void getTipsAndTricks() async {
    emit(TipsAndTricsLoading());
    final tipsAndTricks = await parentRecourceRepo.getTipsAndTricks();
    tipsAndTricks.fold(
      (failure) => emit(TipsAndTricsFailure(errorMessage: failure.errMessage)),
      (tipsAndTricks) => emit(TipsAndTricsLoaded(tipsAndTricks: tipsAndTricks)),
    );
  }
}
