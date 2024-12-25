import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class ReminderDate extends StatelessWidget {
  const ReminderDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
      alignment: Alignment.center,
      width: 109.w,
      height: 96.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: svg_provider.Svg(AppSvgs.dateIcon),
          fit: BoxFit.fill,
        ),
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ).createShader(bounds);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              '12',
              style: TextStyle(
                letterSpacing: 0,
                wordSpacing: 0.2,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50.sp,
                fontFamily: GoogleFonts.rubik().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
