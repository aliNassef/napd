import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.lang,
    required this.isActive,
    this.onTap,
  });
  final String lang;
  final bool isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            AppShadows.shadow6,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lang,
              style: AppStyles.roboto20Bold.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
            Visibility(
              visible: isActive,
              child: SvgPicture.asset(
                AppSvgs.currentChoiceIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
