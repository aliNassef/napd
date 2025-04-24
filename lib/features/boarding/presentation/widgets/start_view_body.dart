import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../signup/presentation/view/signup_view.dart';
import '../../../login/presentation/view/login_view.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/utils/app_styles.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(34),
        Text(
          AppStrings.letsGetStarted,
          style: AppStyles.roboto48Bold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(20),
        RepaintBoundary(
          child: Image.asset(
            AppImages.start,
            width: context.width,
            height: context.height * .45,
          ),
        ),
        DefaultAppButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignupView.routeName);
          },
          text: AppStrings.createAccount,
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.darkBlueColor,
        ),
        VerticalSpace(30),
        DefaultAppButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              LoginView.routeName,
            );
          },
          text: AppStrings.login,
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.darkBlueColor,
        ),
      ],
    );
  }
}
