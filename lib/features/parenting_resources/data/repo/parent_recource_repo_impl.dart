import 'package:dartz/dartz.dart';
import 'package:napd/core/errors/exceptions.dart';

import 'package:napd/core/errors/failure.dart';

import 'package:napd/features/parenting_resources/data/models/recipe_model.dart';

import '../source/recipe_remote_datasource.dart';
import 'parent_recource_repo.dart';

class ParentRecourceRepoImpl extends ParentRecourceRepo {
  final RecipeRemoteDataSource recipeDataSource;

  ParentRecourceRepoImpl({required this.recipeDataSource});

  @override
  Future<Either<Failure, List<RecipeModel>>> getRecipes() async {
    try {
      final recipes = await recipeDataSource.getRecipes();
      return Right(recipes);
    } on ServerException catch (e) {
      return Left(
        Failure(
          errMessage: e.errorModel.errorMessage,
        ),
      );
    }
  }
}
