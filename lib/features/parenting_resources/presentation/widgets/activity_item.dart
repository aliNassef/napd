import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/features/parenting_resources/data/models/activity_model.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/app_shadows.dart';

import '../../../../core/utils/app_styles.dart';

import '../../../../core/widgets/custom_network_image.dart';

import '../../../../core/widgets/spacers.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
    required this.activityModel,
  });
  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppShadows.shadow6,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            activityModel.title,
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            activityModel.content,
            style: AppStyles.roboto14SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const VerticalSpace(18),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomNetworkImage(
                img: activityModel.imageUrl,
                height: 188.h,
                width: 270.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
