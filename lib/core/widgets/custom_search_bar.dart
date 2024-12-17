import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 15.h,
      autocorrect: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
        border: buildBorderStyle(),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildBorderStyle(),
        focusedBorder: buildBorderStyle(),
        hintText: 'Search here..',
        hintStyle: AppStyles.textStyle14R.copyWith(
          color: AppColors.darkBlueColor,
        ),
        suffixIcon: Icon(
          Icons.search,
          size: 24.r,
          color: AppColors.darkBlueColor,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.darkBlueColor,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
