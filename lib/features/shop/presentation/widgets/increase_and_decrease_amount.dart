import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class IncreaseAndDecreaseAmount extends StatelessWidget {
  const IncreaseAndDecreaseAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xffEDEDED),
        border: Border.all(color: AppColors.primaryColor, width: 1.0),
      ),
      child: Column(
        spacing: 5.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: AppColors.darkBlueColor,
          ),
          Text(
            "10",
            style: AppStyles.roboto15SemiBold.copyWith(
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.remove,
            color: AppColors.darkBlueColor,
          )
        ],
      ).withAllPadding(5),
    );
  }
}
