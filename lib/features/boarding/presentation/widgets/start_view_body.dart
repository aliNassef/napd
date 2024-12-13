import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_images.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';

import '../../../../core/utils/app_styles.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(34),
        Text(
          'Let’s get started!',
          style: AppStyles.textStyle48B.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(21),
        Image.asset(
          AppImages.start,
          width: context.width,
          height: context.height * .55,
        ),
        DefaultAppButton(
          padding: context.width * 0.2,
          text: 'Sign up',
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.darkBlueColor,
        ),
        VerticalSpace(30),
        DefaultAppButton(
          padding: context.width * 0.2,
          text: 'Login',
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.darkBlueColor,
        ),
      ],
    );
  }
}