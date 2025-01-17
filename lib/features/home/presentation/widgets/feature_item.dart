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
  });
  final String img;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.5),
            color: Colors.white.withValues(alpha: 0.8),
            boxShadow: [
              AppShadows.shadow2,
            ],
          ),
          child: SvgPicture.asset(img),
        ),
        VerticalSpace(7),
        Text(
          text,
          style: AppStyles.roboto10SemiBold.copyWith(
            color: color,
          ),
        )
      ],
    );
  }
}
