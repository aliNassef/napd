import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ForyouHeader extends StatelessWidget {
  const ForyouHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'For you',
            style: AppStyles.textStyle24B.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.greenLightColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
