
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

class RecipeItemContent extends StatelessWidget {
  const RecipeItemContent({super.key, required this.points});
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Apple and Blueberry Puree',
              style: AppStyles.textStyle24SB.copyWith(
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
              'Ingredients:',
              style: AppStyles.textStyle18R.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        ...points.map(
              (point) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  •  ',
                style: AppStyles.textStyle14R.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
              Expanded(
                child: Text(
                  point,
                  style: AppStyles.textStyle14R.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ),
            ],
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
