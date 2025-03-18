import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

import '../../../../core/widgets/custom_network_image.dart';

class FeaturedGroupItem extends StatelessWidget {
  const FeaturedGroupItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomNetworkImage(
            img:
                'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            height: 85.h,
            width: 85.w,
          ),
        ),
        HorizantalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5.h,
            children: [
              Text(
                'Parenting',
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
              Text(
                '3 M+ members',
                style: AppStyles.roboto20Regular.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        TextButton.icon(
          style: ButtonStyle(
            alignment: Alignment.center,
            iconSize: WidgetStatePropertyAll(20),
            backgroundColor: WidgetStatePropertyAll(
              AppColors.greenLightColor,
            ),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 8.5.h,
              ),
            ),
          ),
          onPressed: () {},
          label: Text(
            AppStrings.join,
            style: AppStyles.roboto20Regular.copyWith(color: Colors.white),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
