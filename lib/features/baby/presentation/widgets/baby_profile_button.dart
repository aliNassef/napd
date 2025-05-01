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
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: AppStyles.roboto20Regular,
          ),
          Spacer(),
          SvgPicture.asset(icon),
        ],
      ),
    );
  }
}
