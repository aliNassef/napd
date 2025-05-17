import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import '../../data/models/tips_trics_model.dart';

class TipItemContent extends StatelessWidget {
  const TipItemContent({
    super.key,
    required this.points,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  final List<Tip> points;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.roboto20SemiBold.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ],
        ),
        VerticalSpace(10),
        ...points.asMap().entries.map(
              (point) => Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${point.key + 1}.',
                        style: AppStyles.roboto14Regular.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        point.value.title,
                        style: AppStyles.roboto14Regular.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  ...point.value.points.map(
                    (point) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  •  ',
                          style: AppStyles.roboto14Regular.copyWith(
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.description,
                            style: AppStyles.roboto14Regular.copyWith(
                              color: AppColors.darkBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        VerticalSpace(18),
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
