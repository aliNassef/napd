import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../view/group_chat_view.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          GroupChatView.routeName,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.star_border,
            color: AppColors.darkBlueColor,
            size: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomNetworkImage(
              img:
                  'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
              height: 85.h,
              width: 85.w,
            ),
          ),
          Column(
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.darkBlueColor.withValues(alpha: 0.6),
              size: 25.r,
            ),
          ),
        ],
      ),
    );
  }
}
