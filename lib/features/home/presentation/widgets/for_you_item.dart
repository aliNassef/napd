import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';

class ForyouItem extends StatelessWidget {
  const ForyouItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      width: 180.w,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          AppShadows.shadow1,
        ],
      ),
      child: Column(
        spacing: 10.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomNetworkImage(
              height: 90.h,
              width: 160.w,
              img:
                  'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
            ),
          ),
          Text(
            'Taking care of your mental health is an act of self-love ',
            style: AppStyles.roboto12Regular.copyWith(
              color: Color(0xff0D1814),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          )
        ],
      ),
    );
  }
}
