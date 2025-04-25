import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/recipe_model.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final ApiConsumer api;
  RecipeRemoteDataSourceImpl({required this.api});

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
}
