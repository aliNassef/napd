import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import 'feature_item.dart';

class HomeFeatures extends StatelessWidget {
  const HomeFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 45.h),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.cryIcon,
            text: 'crytranslation'.tr(),
          ),
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.recipesIcon,
            text: 'recipes'.tr(),
          ),
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.activitesIcon,
            text: 'activities'.tr(),
          ),
        ],
      ),
    );
  }
}
