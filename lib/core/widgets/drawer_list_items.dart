import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';

import '../../features/recipes/presentation/view/recipes_view.dart';
import '../../features/shop/presentation/view/shop_view.dart';
import '../../features/tips&tricks/presentation/view/tips_and_tricks_view.dart';
import '../utils/app_images.dart';
import 'drawer_item.dart';

class DrawerListItems extends StatelessWidget {
  const DrawerListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 50.h,
      children: [
        DrawerItem(
          text: 'Profile',
          img: AppSvgs.profile2Icon,
        ),
        DrawerItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TipsAndTricksView(),
              ),
            );
          },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopView(),
              ),
            );
          },
          text: 'Shop',
          img: AppSvgs.shopIcon,
        ),
        DrawerItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipesView(),
              ),
            );
          },
          text: 'Recipes',
          img: AppSvgs.recipesIcon,
        ),
        DrawerItem(
          text: 'Settings',
          img: AppSvgs.settingIcon,
        ),
      ],
    ).withHorizantalPadding(16);
  }
}
