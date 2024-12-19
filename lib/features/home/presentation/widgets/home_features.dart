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
        // spacing: 20.w,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeatureItem(
            color: AppColors.secondaryColor,
            img: AppSvgs.cryIcon,
            text: 'Cry translation',
          ),
          FeatureItem(
            color: AppColors.darkBlueColor,
            img: AppSvgs.vaccineIcon,
            text: 'Vaccination',
          ),
          FeatureItem(
            color: AppColors.greenLightColor,
            img: AppSvgs.activitesIcon,
            text: 'Activities',
          ),
          FeatureItem(
            color: Color(0xffCCBC41),
            img: AppSvgs.growthIcon,
            text: 'Growth',
          ),
        ],
      ),
    );
  }
}
