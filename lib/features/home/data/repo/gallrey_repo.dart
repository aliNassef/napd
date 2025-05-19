import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import 'package:napd/features/home/data/model/gallrey_model.dart';

abstract class GallreyRepo {
  Future<Either<Failure, void>> uploadGallreyImage(GallreyInputModel gallreyInputModel);
  Future<Either<Failure, void>> deleteGallreyImage(int id);
  Future<Either<Failure, List<GallreyModel>>> getGallreyImages();
}