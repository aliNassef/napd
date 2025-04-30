import 'package:dartz/dartz.dart';
import 'package:napd/core/model/profile_model.dart';
import 'package:napd/features/profile/data/repo/profile_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/profile_remote_source.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteSource profileRemoteSource;

  ProfileRepoImpl({required this.profileRemoteSource});
  @override
  Future<Either<Failure, MotherProfileModel>> getProfile() async {
    try {
      final profile = await profileRemoteSource.getProfile();
      return Right(profile);
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
