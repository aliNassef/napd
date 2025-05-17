import 'package:napd/features/parenting_resources/data/models/activity_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/recipe_model.dart';
import '../models/tips_trics_model.dart';

abstract class ParentResourceRemoteDataSource {
  Future<List<RecipeModel>> getRecipes();
  Future<List<ActivityModel>> getActivites();
  Future<List<TipsAndTricksModel>> getTipsAndTricks();
}

class ParentResourceRemoteDataSourceImpl
    implements ParentResourceRemoteDataSource {
  final ApiConsumer api;
  ParentResourceRemoteDataSourceImpl({required this.api});

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final response = await api.get(EndPoints.recipes);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((recipe) => RecipeModel.fromJson(recipe))
          .toList();
    } else {
      throw ServerException(
        ErrorModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<ActivityModel>> getActivites() async {
    final response = await api.get(EndPoints.activites);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((activity) => ActivityModel.fromJson(activity)).toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TipsAndTricksModel>> getTipsAndTricks() async {
    final response = await api.get(EndPoints.tipsAndtricks);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((activity) => TipsAndTricksModel.fromJson(activity)).toList();
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
