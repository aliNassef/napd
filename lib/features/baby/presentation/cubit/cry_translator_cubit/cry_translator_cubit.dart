import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/baby/data/repo/baby_repo.dart';

import '../../../data/models/cry_model.dart';

part 'cry_translator_state.dart';

class CryTranslatorCubit extends Cubit<CryTranslatorState> {
  CryTranslatorCubit({required this.babyRepo}) : super(CryTranslatorInitial());
  final BabyRepo babyRepo;
  void detectAudio(String filePath) async {
    emit(CryTranslatorLoading());
    final result = await babyRepo.detectAudio(filePath);
    result.fold(
      (failure) => emit(CryTranslatorError(errMessage: failure.errMessage)),
      (cryModel) => emit(CryTranslatorSuccess(cryModel: cryModel)),
    );
  }
}
