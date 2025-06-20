import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/baby/data/repo/baby_repo.dart';
import 'package:napd/features/baby/data/models/add_baby_input_model.dart';

part 'add_baby_state.dart';

class AddBabyCubit extends Cubit<AddBabyState> {
  AddBabyCubit({required this.repo}) : super(AddBabyInitial());
  final BabyRepo repo;
  void addBaby(AddBabyInputModel addBabyInputModel) async {
    emit(AddBabyLoading());
    final result = await repo.addBaby(addBabyInputModel);
    result.fold(
      (failure) => emit(AddBabyFailure(errMessage: failure.errMessage)),
      (baby) => emit(AddBabyLoaded()),
    );
  }
}
