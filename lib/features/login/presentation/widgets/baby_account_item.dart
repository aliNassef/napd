import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BabyAccountItem extends StatelessWidget {
  const BabyAccountItem({
    super.key,
    required this.img,
    required this.name,
  });
  final String img;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Container(
          height: 175.h,
          width: 220.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(
                img,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          name,
          style: AppStyles.roboto32Bold.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
