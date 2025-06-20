import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:napd/core/utils/app_styles.dart';

class ReminderGroupAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReminderGroupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 47.h,
      title: TabBar(
        dividerColor: AppColors.darkBlueColor.withValues(alpha: 0.6),
        dividerHeight: 1,
        automaticIndicatorColorAdjustment: false,
        labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
        indicatorPadding: EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.center,
        padding: EdgeInsets.all(0),
        unselectedLabelColor: AppColors.darkBlueColor,
        labelColor: AppColors.secondaryColor,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            child: Text(
              AppStrings.reminder,
              style: AppStyles.roboto18SemiBold,
            ),
          ),
          Tab(
            child: Text(
              AppStrings.routine,
              style: AppStyles.roboto18SemiBold,
            ),
          ),
        ],
      ),
    );
  }

  @override
   Size get preferredSize => Size.fromHeight(47.h);
}
