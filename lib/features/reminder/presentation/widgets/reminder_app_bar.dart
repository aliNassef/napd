import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ReminderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReminderAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                  size: 24.r,
                ),
              ),
            ),
            Expanded(
              child: Text(
                AppStrings.reminder,
                style: AppStyles.roboto26Bold.copyWith(
                  color: AppColors.secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
