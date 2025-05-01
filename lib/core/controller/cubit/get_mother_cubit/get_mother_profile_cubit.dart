import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:napd/features/profile/data/repo/profile_repo.dart';
import '../../../model/profile_model.dart';
part 'get_mother_profile_state.dart';

class GetMotherProfileCubit extends Cubit<GetMotherProfileState> {
  GetMotherProfileCubit(this.profileRepo) : super(GetMotherProfileInitial());
  final ProfileRepo profileRepo;
  void getMotherProfile() async {
    emit(GetMotherProfileLoading());
    final motherOrfailure = await profileRepo.getProfile();
    motherOrfailure.fold(
      (failure) {
        emit(
          GetMotherProfileFailure(errorMessage: failure.errMessage),
        );
      },
      (profileModel) {
        emit(
          GetMotherProfileLoaded(profileModel: profileModel),
        );
      },
    );
  }

  void logout() async {
    await profileRepo.logout();
    emit(GetMotherProfileLogout());
  }
}
