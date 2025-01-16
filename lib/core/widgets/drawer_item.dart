import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:napd/core/entities/drawer_item_entity.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'spacers.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemEntity,
  });
  final DrawerItemEntity drawerItemEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        drawerItemEntity.onTap!(context);
      },
      child: Row(
        children: [
          SvgPicture.asset(
            drawerItemEntity.image,
            width: 30.w,
            height: 30.h,
          ),
          HorizantalSpace(16),
          Text(
            drawerItemEntity.text,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
