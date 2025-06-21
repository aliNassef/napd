import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';
import '../model/search_model.dart';
import '../source/home_remote_source.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteSource homeRemoteSource;
  HomeRepoImpl(this.homeRemoteSource);
  @override
  Future<Either<Failure, SearchModel>> search(String query) async {
    try {
      final result = await homeRemoteSource.search(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}