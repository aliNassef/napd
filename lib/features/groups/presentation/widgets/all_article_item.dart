
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/spacers.dart';

class AllArticleItem extends StatelessWidget {
  const AllArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppShadows.shadow6],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CustomNetworkImage(
              height: 100.h,
              width: 100.w,
              img:
                  'https://r2.starryai.com/results/1042152870/6eb099de-74c0-460b-900e-551a3e7c540f.webp',
            ),
          ),
          HorizantalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The importance of parenting in a digital age',
                  style: AppStyles.roboto16Medium.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                ),
                VerticalSpace(8),
                Row(
                  spacing: 14.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.clockIcon,
                      height: 20.h,
                      width: 20.w,
                    ),
                    Text(
                      '2hr ago',
                      style: AppStyles.roboto11Regular.copyWith(
                        color: Color(0xff808080),
                      ),
                    ),
                    Icon(
                      Icons.visibility_outlined,
                      color: Color(0xff808080),
                      size: 17,
                    ),
                    Text(
                      '360 views',
                      style: AppStyles.roboto11Regular.copyWith(
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
