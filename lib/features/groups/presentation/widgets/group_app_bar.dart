import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 47.h,
      title: TabBar(
        dividerColor: AppColors.darkBlueColor.withValues(alpha: 0.6),
        dividerHeight: 1,
        automaticIndicatorColorAdjustment: false,
        labelPadding: EdgeInsets.symmetric(horizontal: 30.w),
        indicatorPadding: EdgeInsets.all(0),
        tabAlignment: TabAlignment.center,
        padding: EdgeInsets.all(0),
        unselectedLabelColor: AppColors.darkBlueColor,
        labelColor: AppColors.secondaryColor,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            child: Text(
              'Groups',
              style: AppStyles.textStyle18SB,
            ),
          ),
          Tab(
            child: Text(
              'For you',
              style: AppStyles.textStyle18SB,
            ),
          ),
          Tab(
            child: Text(
              'Chat Bot',
              style: AppStyles.textStyle18SB,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(47.h);
}
