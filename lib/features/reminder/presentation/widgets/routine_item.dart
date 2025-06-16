import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

class RoutineItem extends StatelessWidget {
  const RoutineItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          AppShadows.shadow6,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Wake up time',
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6.w,
            children: [
              SvgPicture.asset(AppSvgs.clockRoutineIcon),
              Text(
                '06:00 AM',
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: Color(0xff808080),
                ),
              ),
            ],
          ),
          VerticalSpace(5),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 157.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'To-do',
                  style: AppStyles.roboto20SemiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
