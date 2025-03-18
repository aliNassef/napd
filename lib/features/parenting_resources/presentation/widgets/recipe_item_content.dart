import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import 'recipe_point_item.dart';

class RecipeItemContent extends StatelessWidget {
  const RecipeItemContent({
    super.key,
    required this.nutritionalPoints,
    required this.ingredientsPoints,
  });
  final List<String> nutritionalPoints;
  final List<String> ingredientsPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Apple and Blueberry Puree',
              style: AppStyles.roboto24SemiBold.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ],
        ),
        VerticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.ingredients,
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        ...nutritionalPoints.map(
          (point) => RecipePointItem(point: point),
        ),
        VerticalSpace(11),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.nutritionalValue,
              style: AppStyles.roboto18Regular.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        ...nutritionalPoints.map(
          (point) => RecipePointItem(
            point: point,
          ),
        ),
        VerticalSpace(21),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CustomNetworkImage(
            img:
                'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            width: 270.w,
            height: 188.h,
          ),
        ),
      ],
    );
  }
}
