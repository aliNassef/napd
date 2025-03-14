import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import 'for_you_header.dart';
import 'for_you_item.dart';
import 'home_features.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Laila',
              style: AppStyles.roboto24SemiBold.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ),
          VerticalSpace(6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'is 1 year and 3 months',
              style: AppStyles.roboto16Regular.copyWith(
                color: AppColors.greenLightColor,
              ),
            ),
          ),
          VerticalSpace(40),
          HomeFeatures(),
          VerticalSpace(30),
          ForyouHeader(),
          VerticalSpace(7),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SizedBox(
              height: 160.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => ForyouItem(),
                separatorBuilder: (_, index) => HorizantalSpace(8),
                itemCount: 4,
              ),
            ),
          ),
          VerticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'captureyourmoments'.tr(),
                  style: AppStyles.roboto24SemiBold.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                HorizantalSpace(23),
                Image.asset(
                  AppImages.camera,
                ),
              ],
            ),
          ),
          VerticalSpace(22),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomNetworkImage(
              img:
                  'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
              width: context.width,
              height: context.height * 2 / 5,
            ),
          ),
          VerticalSpace(40),
        ],
      ),
    );
  }
}
