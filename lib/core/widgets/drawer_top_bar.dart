import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'spacers.dart';

class DrawerTopBar extends StatelessWidget {
  const DrawerTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.5.r,
            backgroundImage: AssetImage(
              AppImages.dummyGirl,
            ),
          ),
          HorizantalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mai Ali',
                style: AppStyles.roboto20Bold,
              ),
              TextButton.icon(
                style: ButtonStyle(
                  iconSize: WidgetStatePropertyAll(15),
                  alignment: Alignment.center,
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.secondaryColor,
                  ),
                ),
                onPressed: () {},
                label: Text(
                  'baby'.tr(),
                  style: AppStyles.roboto14Regular.copyWith(
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
