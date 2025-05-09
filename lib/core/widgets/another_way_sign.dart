import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_strings.dart';

import '../extensions/padding_extension.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AnotherWaySign extends StatelessWidget {
  const AnotherWaySign({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withValues(alpha: 0.8),
            height: 1,
            thickness: 1,
          ),
        ),
        Text(
          AppStrings.orRegisterWith,
          style: AppStyles.roboto14Regular.copyWith(
            fontFamily: GoogleFonts.urbanist().fontFamily,
            color: AppColors.greyColor,
          ),
        ).withHorizontalPadding(12),
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withValues(alpha: 0.8),
            height: 1,
            thickness: 1,
          ),
        ),
      ],
    ).withHorizontalPadding(16.w);
  }
}
