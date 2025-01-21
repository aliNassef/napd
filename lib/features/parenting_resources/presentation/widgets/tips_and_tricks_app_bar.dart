import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TipsAndTricksAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TipsAndTricksAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 24.r,
          ),
        ),
      ),
      title: Text(
        'tipsandtricks'.tr(),
        style: AppStyles.roboto26Bold.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
