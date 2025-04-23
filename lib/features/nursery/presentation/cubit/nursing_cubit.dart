import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:napd/features/nursery/data/repo/nursing_repo.dart';

import '../../../../core/errors/failure.dart';
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

  void getAllHospitals() async {
    emit(HospitalsLoading());
    final hospitalsOrfailure = await _nursingRepo.getAllHospitals();
    hospitalsOrfailure.fold(
      (failure) => emit(HospitalsFailure(failure.errMessage)),
      (hospitals) => emit(HospitalsLoaded(hospitals: hospitals)),
    );
  }

  void getFilteredHospitals(int id) async {
    emit(HospitalsLoading());
    final hospitalsOrfailure = await _nursingRepo.getFilterdHospitals(id);
    hospitalsOrfailure.fold(
      (failure) => emit(HospitalsFailure(failure.errMessage)),
      (hospitals) => emit(
        HospitalsLoaded(hospitals: hospitals),
      ),
    );
  }

  Future<void> addHospitalToFav(int id) async {
    await _toggleFavoriteHospital(id, _nursingRepo.addHospitalToFav(id));
  }

  Future<void> delHospitalFromFav(int id) async {
    await _toggleFavoriteHospital(id, _nursingRepo.delHospitalFromFav(id));
  }

  Future<void> _toggleFavoriteHospital(
      int id, Future<Either<Failure, void>> addOrdeleteFavorite) async {
    emit(ToggleFavoriteLoading(id: id));
    final addedOrfailure = await addOrdeleteFavorite;
    addedOrfailure.fold(
      (failure) => emit(ToggleFavoriteFailure(failure.errMessage)),
      (added) => emit(ToggleFavoriteLoaded(id: id)),
    );
  }
}