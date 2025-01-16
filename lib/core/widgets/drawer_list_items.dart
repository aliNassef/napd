import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/entities/drawer_item_entity.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../features/parenting_resources/presentation/views/recipes_view.dart';
import '../../features/settings/presentation/view/settings_view.dart';
import '../../features/shop/presentation/view/shop_view.dart';
import '../../features/parenting_resources/presentation/views/tips_and_tricks_view.dart';
import '../utils/app_images.dart';
import 'drawer_item.dart';

class DrawerListItems extends StatefulWidget {
  const DrawerListItems({
    super.key,
  });

  @override
  State<DrawerListItems> createState() => _DrawerListItemsState();
}

class _DrawerListItemsState extends State<DrawerListItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16.w),
      itemBuilder: (_, index) =>
          DrawerItem(drawerItemEntity: drawerItems[index]),
      separatorBuilder: (_, __) => VerticalSpace(50.h),
      itemCount: drawerItems.length,
    );
  }

  List<DrawerItemEntity> drawerItems = [
    DrawerItemEntity(
      text: 'Profile',
      image: AppSvgs.profile2Icon,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsView(),
          ),
        );
      },
    ),
    DrawerItemEntity(
      text: 'Tips & Tricks',
      image: AppSvgs.tipsTricsIcon,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TipsAndTricksView(),
          ),
        );
      },
    ),
    DrawerItemEntity(
      text: 'Cry translation',
      image: AppSvgs.cryIcon,
      onTap: (context) {},
    ),
    DrawerItemEntity(
      text: 'Activities',
      image: AppSvgs.activitesIcon,
      onTap: (context) {},
    ),
    DrawerItemEntity(
      text: 'Shop',
      image: AppSvgs.shopIcon,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopView(),
          ),
        );
      },
    ),
    DrawerItemEntity(
      text: 'Recipes',
      image: AppSvgs.recipesIcon,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipesView(),
          ),
        );
      },
    ),
    DrawerItemEntity(
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsView(),
          ),
        );
      },
      text: 'Settings',
      image: AppSvgs.settingIcon,
    ),
  ];
}
