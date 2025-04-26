import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_strings.dart';

import '../../../../core/utils/app_shadows.dart';
import '../../data/models/recipe_model.dart';
import 'recipe_item_content.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow4,
        ],
      ), 
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: RecipeItemContent(
        title: recipeModel.title,
        image: recipeModel.imageUrl,
        nutritionalPoints: [
          '${AppStrings.calories}:${recipeModel.calories}',
          '${AppStrings.carbohydrates}:${recipeModel.carbohydrates}',
          '${AppStrings.fiber}:${recipeModel.fiber}',
          '${AppStrings.protein}:${recipeModel.protein}',
          '${AppStrings.naturalSugars}:${recipeModel.naturalSugars}',
        ],
        ingredientsPoints: recipeModel.ingredients,
      ),
    );
  }
}
