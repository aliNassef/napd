import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isChecked = !isChecked;
        setState(() {});
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColor, width: 2.w),
        ),
        alignment: Alignment.center,
        child: !isChecked
            ? SizedBox()
            : Icon(
                Icons.check,
                color: AppColors.secondaryColor,
              ),
      ),
    );
  }
}
