import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';

import 'package:napd/core/errors/failure.dart';
import 'package:napd/features/parenting_resources/data/models/activity_model.dart';

import 'package:napd/features/parenting_resources/data/models/recipe_model.dart';

import '../source/parent_resource_remote_datasource.dart';
import 'parent_recource_repo.dart';

class ParentRecourceRepoImpl extends ParentRecourceRepo {
  final ParentResourceRemoteDataSource parentResourceDataSource;

  ParentRecourceRepoImpl({required this.parentResourceDataSource});

  @override
  Future<Either<Failure, List<RecipeModel>>> getRecipes() async {
    try {
      final recipes = await parentResourceDataSource.getRecipes();
      return Right(recipes);
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ActivityModel>>> getActivites() async {
    try {
      final activities = await parentResourceDataSource.getActivites();
      return Right(activities);
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
