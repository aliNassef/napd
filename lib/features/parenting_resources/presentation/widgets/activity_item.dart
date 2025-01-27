import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/app_shadows.dart';

import '../../../../core/utils/app_styles.dart';

import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/widgets/spacers.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow6,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            'Blocks, Jigsaws, and Shape Sorters',
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            'Playing with blocks, jigsaws, and shape sorters all lay the foundations of spatial thinking, logical reasoning, ordering, and recognising various shapes, sizes, and colours.',
            style: AppStyles.roboto14SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalSpace(18),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomNetworkImage(
                img:
                    'https://r2.starryai.com/results/1042152870/6eb099de-74c0-460b-900e-551a3e7c540f.webp',
                height: 188.h,
                width: 270.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
