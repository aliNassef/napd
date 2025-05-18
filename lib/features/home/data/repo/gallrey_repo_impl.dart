import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../source/gallrey_remote_source.dart';
import 'gallrey_repo.dart';

class GallreyRepoImpl extends GallreyRepo {
  final GallreyRemoteSource remoteSource;

  GallreyRepoImpl({required this.remoteSource});
  @override
  Future<Either<Failure, void>> uploadGallreyImage(
      GallreyInputModel gallreyInputModel) async {
    try {
      await remoteSource.uploadGallreyImage(gallreyInputModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<GallreyModel>>> getGallreyImages() async {
    try {
      final result = await remoteSource.getGallreyImages();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteGallreyImage(String id) async {
    try {
      await remoteSource.deleteGallreyImage(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
