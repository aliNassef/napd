import 'package:bloc/bloc.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo.dart';

import 'nursing_state.dart';

class NursingCubit extends Cubit<NursingState> {
  NursingCubit(this._nursingRepo) : super(NursingIntial());
  final NursingRepo _nursingRepo;

  void getAllGovernorates() async {
    emit(GovernateLoading());
    final governatesOrfailure = await _nursingRepo.getAllGovernorates();
    governatesOrfailure.fold(
      (failure) => emit(GovernateFailure(failure.errMessage)),
      (governates) => emit(GovernateLoaded(governorates: governates)),
    );
  }
}
