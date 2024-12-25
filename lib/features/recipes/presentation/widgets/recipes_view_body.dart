import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/widgets/custom_network_image.dart';
import 'recipe_item_content.dart';

class RecipesViewBody extends StatelessWidget {
  const RecipesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemBuilder: (_, index) => Container(
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: RecipeItemContent(
          points: [
            '1 apple (peeled and chopped',
            '1/4 cup blueberries',
            '1/2 cup water',
          ],
        ),
      ),
      separatorBuilder: (_, __) => VerticalSpace(18),
      itemCount: 10,
    );
  }
}
