import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/activity_model.dart';
import '../models/recipe_model.dart';
import '../models/tips_trics_model.dart';

abstract class ParentRecourceRepo {
  Future<Either<Failure, List<RecipeModel>>> getRecipes();
  Future<Either<Failure, List<ActivityModel>>> getActivites();
  Future<Either<Failure, List<TipsAndTricksModel>>> getTipsAndTricks();
}
