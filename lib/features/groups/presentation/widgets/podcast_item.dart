
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

import '../../../../core/widgets/custom_network_image.dart';

class PodcastItem extends StatelessWidget {
  const PodcastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: CustomNetworkImage(
            img:
                'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            width: 120.w,
            height: 200.h,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.darkBlueColor.withValues(alpha: 0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Text(
              'Understanding mental health',
              style: AppStyles.textStyle14R.copyWith(
                color: Color(0xfff5f5f5),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Icon(
            Icons.mic,
            color: AppColors.darkBlueColor,
          ),
        )
      ],
    );
  }
}
