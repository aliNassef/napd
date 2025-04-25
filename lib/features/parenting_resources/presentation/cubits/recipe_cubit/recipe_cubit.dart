import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:napd/features/parenting_resources/data/repo/parent_recource_repo.dart';

import '../../../data/models/recipe_model.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.parentRecourceRepo) : super(RecipeInitial());
  final ParentRecourceRepo parentRecourceRepo;
  void getRecipes() async {
    emit(RecipeLoading());
    final recipes = await parentRecourceRepo.getRecipes();
    recipes.fold(
      (failure) => emit(RecipeFailure(errorMessage: failure.errMessage)),
      (recipes) => emit(RecipeLoaded(recipes: recipes)),
    );
  }
}
