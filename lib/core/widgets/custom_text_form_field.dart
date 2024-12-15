import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final int maxLines;
  final TextInputType keyboardType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.greyColor,
      obscureText: isSecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      maxLines: widget.maxLines,
      // maxLength: widget.maxLength,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        hintText: widget.hintText,
        hintStyle: AppStyles.textStyle20R.copyWith(
          color: AppColors.greyColor.withValues(
            alpha: 0.6,
          ),
        ),
        border: buildBorderStyle(
          AppColors.greyColor,
        ),
        enabledBorder: buildBorderStyle(
          AppColors.greyColor,
        ),
        focusedBorder: buildBorderStyle(
          AppColors.greyColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: isSecure
                    ? const Icon(
                        Icons.visibility_off,
                        color: AppColors.greyColor,
                      )
                    : const Icon(
                        Icons.visibility_sharp,
                        color: AppColors.greyColor,
                      ),
              )
            : const SizedBox(),
      ),
    );
  }

  OutlineInputBorder buildBorderStyle(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
