import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';
import 'package:napd/features/home/data/repo/gallrey_repo.dart';

part 'gallrey_state.dart';

class GallreyCubit extends Cubit<GallreyState> {
  final GallreyRepo gallreyRepo;
  GallreyCubit(this.gallreyRepo) : super(GallreyInitial());
  void uploadImageToGallrey(GallreyInputModel gallreyInputModel) async {
    emit(AddImageToGallreyStateLoading());
    final result = await gallreyRepo.uploadGallreyImage(
      gallreyInputModel,
    );
    result.fold(
      (failure) =>
          emit(AddImageToGallreyStateFailure(errMessage: failure.errMessage)),
      (gallreyImages) => emit(AddImageToGallreyStateLoaded()),
    );
  }

  void getGallreyImages() async {
    emit(GallreyLoading());
    final result = await gallreyRepo.getGallreyImages();
    result.fold(
      (failure) => emit(GallreyFailure(errMessage: failure.errMessage)),
      (gallreyImages) => emit(GallreyLoaded(gallrey: gallreyImages)),
    );
  }

  void deleteGallreyImage(int id) async {
    emit(DeleteImageToGallreyStateLoading());
    final deleteOrfailure = await gallreyRepo.deleteGallreyImage(id);
    deleteOrfailure.fold(
      (failure) => emit(DeleteImageToGallreyStateFailure(errMessage: failure.errMessage)),
      (gallreyImages) {
        emit(DeleteImageToGallreyStateLoaded());
        getGallreyImages();
      },
    );
  }
}
