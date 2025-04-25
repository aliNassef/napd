import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/features/parenting_resources/presentation/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/models/recipe_model.dart';
import 'recipe_item.dart';

class RecipesViewBody extends StatelessWidget {
  const RecipesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      buildWhen: (previous, current) =>
          current is RecipeLoading ||
          current is RecipeLoaded ||
          current is RecipeFailure,
      builder: (context, state) {
        if (state is RecipeLoaded) {
          var recipes = state.recipes;
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            itemBuilder: (_, index) => RecipeItem(
              recipeModel: recipes[index],
            ),
            separatorBuilder: (_, __) => VerticalSpace(18),
            itemCount: 10,
          );
        }
        if (state is RecipeFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        if (state is RecipeLoading) {
          var dummyRecipeModel = RecipeModel(
            title: 'Banana Oatmeal Mash',
            ingredients: ['1 small banana', '2 tbsp oats', '1/4 cup milk'],
            calories: '120 kcal',
            carbohydrates: '22 g',
            fiber: '3 g',
            protein: '3 g',
            naturalSugars: '12 g',
            imageUrl: 'assets/images/recipes/banana_oatmeal.jpg',
          );
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              itemBuilder: (_, index) => RecipeItem(
                recipeModel: dummyRecipeModel,
              ),
              separatorBuilder: (_, __) => VerticalSpace(18),
              itemCount: 10,
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
