import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/mediaquery_size.dart';
import '../utils/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.7, 1],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.secondaryColor,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: child,
    );
  }
}
