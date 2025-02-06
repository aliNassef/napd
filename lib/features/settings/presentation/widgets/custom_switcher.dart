import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({
    super.key,
  });

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        padding: EdgeInsets.all(4),
        width: 45.w,
        height: 25.h,
        // duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Color(0xffEAE8E8),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: AppColors.darkBlueColor,
            width: 3,
          ),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 100),
          curve: Curves.linear,
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: SvgPicture.asset(
            AppSvgs.switcherIcon,
          ),
        ),
      ),
    );
  }
}
