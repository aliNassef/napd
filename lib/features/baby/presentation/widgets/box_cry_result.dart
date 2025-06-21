
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BoxCryResult extends StatelessWidget {
  const BoxCryResult({
    super.key,
    required this.result,
  });
  final String result;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
        ),
        color: Color(0xffFFB8D5).withValues(alpha: 0.11),
      ),
      padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 21.h),
      child: Text(
        result,
        style: AppStyles.roboto20Regular.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
