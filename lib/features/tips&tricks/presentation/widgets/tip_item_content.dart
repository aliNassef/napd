import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

class TipItemContent extends StatelessWidget {
  const TipItemContent({
    super.key,
    required this.points,
    required this.title,
    required this.tipNumber,
  });
  final List<String> points;
  final String title;
  final String tipNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tips for comfy Sleeping',
              style: AppStyles.textStyle24SB.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ],
        ),
        VerticalSpace(10),
        Row(
          children: [
            Text(
              '1.',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            Text(
              'Establish a Bedtime Routine:',
              style: AppStyles.textStyle14R.copyWith(
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
        VerticalSpace(18),
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
