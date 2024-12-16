
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_images.dart';
import 'drawer_item.dart';

class DrawerListItems extends StatelessWidget {
  const DrawerListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 50.h,
        children: [
          DrawerItem(
            text: 'Profile',
            img: AppSvgs.profile2Icon,
          ),
          DrawerItem(
            text: 'Tips & Tricks',
            img: AppSvgs.tipsTricsIcon,
          ),
          DrawerItem(
            text: 'Cry translation',
            img: AppSvgs.cryIcon,
          ),
          DrawerItem(
            text: 'Activities',
            img: AppSvgs.activitesIcon,
          ),
          DrawerItem(
            text: 'Shop',
            img: AppSvgs.shopIcon,
          ),
          DrawerItem(
            text: 'Recipes',
            img: AppSvgs.recipesIcon,
          ),
          DrawerItem(
            text: 'Settings',
            img: AppSvgs.settingIcon,
          ),
        ],
      ),
    );
  }
}
