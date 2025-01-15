import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_network_image.dart';

class NurseryItem extends StatelessWidget {
  const NurseryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomNetworkImage(
                  height: 100.h,
                  width: 100.w,
                  img:
                      'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'El zahraa Hospital',
                        style: AppStyles.rubik18Medium.copyWith(
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        alignment: Alignment.center,
                        onPressed: () {},
                        icon: SvgPicture.asset(AppSvgs.favIcon),
                      ),
                    ],
                  ),
                  Text(
                    'Intensive care unit',
                    style: AppStyles.rubik14Light.copyWith(
                      color: Color(0xff808080),
                    ),
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Color(0xffF6D060),
                        ),
                        itemCount: 5,
                        itemSize: 14.0,
                        direction: Axis.horizontal,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        'open',
                        style: AppStyles.rubik16Medium
                            .copyWith(color: AppColors.greenLightColor),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
