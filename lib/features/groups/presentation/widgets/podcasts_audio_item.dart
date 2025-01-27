import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class PodcastsAudioItem extends StatelessWidget {
  const PodcastsAudioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [AppShadows.shadow6],
        ),
        padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            HorizantalSpace(12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(4),
                      Text(
                        'Calm it Down',
                        style: AppStyles.roboto18Medium.copyWith(
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppSvgs.clockIcon,
                            width: 20.w,
                            height: 20.h,
                          ),
                          HorizantalSpace(6),
                          Text(
                            '26:45',
                            style: AppStyles.roboto12Regular.copyWith(
                              color: Color(0xff808080),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SvgPicture.asset(
                      AppSvgs.playIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
