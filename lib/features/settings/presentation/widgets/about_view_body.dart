import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          VerticalSpace(20),
          Text(
            'Welcome to MamaCare',
            style: AppStyles.roboto32SeminBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          Text(
            ' your trusted companion in motherhood! We know that being a new mom is both exciting and overwhelming, and were here to support you every step of the way.',
            style: AppStyles.roboto20Medium.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            'Why Choose Us?',
            style: AppStyles.roboto32SeminBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          Text(
            '''1-Designed by moms & experts – Real advice, real experience.
2-Simple & easy-to-use – No complicated steps, just helpful tools.
3-Evidence-based guidance – Backed by pediatricians and baby care specialists.''',
            style: AppStyles.roboto20Medium.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            '''Join thousands of moms who trust MamaCare to make parenting easier! 
Download the app today and start your journey with confidence.''',
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          )
        ],
      ).withHorizontalPadding(16),
    );
  }
}
