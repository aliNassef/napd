import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/utils/app_colors.dart';

import '../../../../core/utils/app_styles.dart';

class SuggestMessageButton extends StatelessWidget {
  const SuggestMessageButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(context.width * 0.8, 45.h),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 11.h,
          horizontal: 20.w,
        ),
        backgroundColor: Color(0xffEAE8E8),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: AppStyles.roboto16Regular.copyWith(
          color: AppColors.darkBlueColor,
        ),
      ),
    );
  }
}
