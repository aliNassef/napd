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
  });
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          img,
          width: 30.w,
          height: 30.h,
        ),
        HorizantalSpace(16),
        Text(
          text,
          style: AppStyles.textStyle24R.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
