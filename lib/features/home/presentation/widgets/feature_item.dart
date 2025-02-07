import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.img,
    required this.text,
    required this.color,
    this.onTap,
  });
  final String img;
  final String text;
  final Color color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.5),
              color: Color(0xfffefbfe),
              boxShadow: [
                AppShadows.shadow2,
              ],
            ),
            child: SvgPicture.asset(img),
          ),
          VerticalSpace(7),
          Text(
            text,
            style: AppStyles.roboto15SemiBold.copyWith(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
