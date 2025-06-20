import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/baby/data/models/add_baby_input_model.dart';
import 'package:napd/features/baby/data/repo/baby_repo.dart';

part 'update_baby_profile_state.dart';

class UpdateBabyProfileCubit extends Cubit<UpdateBabyProfileState> {
  UpdateBabyProfileCubit({required this.babyRepo}) : super(UpdateBabyProfileInitial());
  final BabyRepo babyRepo;
  void updateBabyProfile(AddBabyInputModel addBabyInputModel) async{
    emit(UpdateBabyProfileLoading());
    final result = await babyRepo.updateBabyProfile(addBabyInputModel);
    result.fold(
      (failure) => emit(UpdateBabyProfileFailure(errMessage: failure.errMessage)),
      (baby) => emit(UpdateBabyProfileSuccess()),
    );
  }
}
