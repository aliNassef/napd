import 'package:easy_localization/easy_localization.dart';
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
      padding: EdgeInsetsDirectional.only(start: 16.w),
      itemBuilder: (_, index) =>
          DrawerItem(drawerItemEntity: drawerItems[index]),
      separatorBuilder: (_, __) => VerticalSpace(50.h),
      itemCount: drawerItems.length,
    );
  }

  List<DrawerItemEntity> drawerItems = [
    DrawerItemEntity(
      text: 'profile'.tr(),
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
      text: 'tipsandtricks'.tr(),
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
      text: 'crytranslation'.tr(),
      image: AppSvgs.cryIcon,
      onTap: (context) {},
    ),
    DrawerItemEntity(
      text: 'activities'.tr(),
      image: AppSvgs.activitesIcon,
      onTap: (context) {},
    ),
    DrawerItemEntity(
      text: 'shop'.tr(),
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
      text: 'recipes'.tr(),
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
      text: 'settings'.tr(),
      image: AppSvgs.settingIcon,
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsView(),
          ),
        );
      },
    ),
  ];
}
