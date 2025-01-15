import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'spacers.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.img,
    required this.text,
    this.onTap,
  });
  final String img;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            img,
            width: 30.w,
            height: 30.h,
          ),
          HorizantalSpace(16),
          Text(
            text,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
