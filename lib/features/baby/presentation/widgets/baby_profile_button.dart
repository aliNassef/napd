import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_styles.dart';

class BabyProfileButton extends StatelessWidget {
  const BabyProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.onPressed,
  });
  final String icon;
  final String text;
  final Color backgroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
      ),
      icon: SvgPicture.asset(
        icon,
      ),
      onPressed: onPressed,
      label: Padding(
        padding: const EdgeInsets.only(
          left: 13,
        ),
        child: Text(
          text,
          style: AppStyles.roboto20Regular,
        ),
      ),
    );
  }
}
