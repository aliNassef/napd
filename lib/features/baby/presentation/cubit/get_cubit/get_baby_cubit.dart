import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:napd/features/baby/data/repo/baby_repo.dart';

import '../../../data/models/baby_model.dart';

part 'get_baby_state.dart';

class GetBabyCubit extends Cubit<GetBabyState> {
  GetBabyCubit(this.babyRepo) : super(GetBabyInitial());
  final BabyRepo babyRepo;

  void getBaby() async {
    emit(GetBabyLoading());
    final result = await babyRepo.getBaby();
    result.fold(
      (failure) => emit(GetBabyFailure(errorMessage: failure.errMessage)),
      (baby) => emit(GetBabyLoaded(baby: baby)),
    );
  }
}
