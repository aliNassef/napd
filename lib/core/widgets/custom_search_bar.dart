import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.vertivalPadding = 5,
    this.onChanged,
  });
  final double vertivalPadding;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorHeight: 15.h,
      autocorrect: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: vertivalPadding.h,
        ),
        border: buildBorderStyle(),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildBorderStyle(),
        focusedBorder: buildBorderStyle(),
        hintText: AppStrings.searchHere,
        hintStyle: AppStyles.roboto14Regular.copyWith(
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
