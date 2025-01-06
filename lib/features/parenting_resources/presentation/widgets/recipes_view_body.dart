import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/spacers.dart';
import 'recipe_item.dart';


class RecipesViewBody extends StatelessWidget {
  const RecipesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemBuilder: (_, index) => RecipeItem(),
      separatorBuilder: (_, __) => VerticalSpace(18),
      itemCount: 10,
    );
  }
}
