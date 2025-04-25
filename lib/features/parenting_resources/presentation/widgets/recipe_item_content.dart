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
    required this.image,
    required this.title,
  });
  final List<String> nutritionalPoints;
  final List<String> ingredientsPoints;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
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
        ...ingredientsPoints.map(
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
            img: image,
            width: 270.w,
            height: 188.h,
          ),
        ),
      ],
    );
  }
}
