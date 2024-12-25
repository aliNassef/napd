import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'recipe_item_content.dart';
class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
