import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import 'mother_account_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            AppStrings.createAccount,
            style: AppStyles.roboto48Bold.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          VerticalSpace(35),
          Text(
            AppStrings.signUpToGetStarted,
            style: AppStyles.roboto20Regular.copyWith(
              color: AppColors.greyColor.withValues(alpha: 0.6),
            ),
          ),
          VerticalSpace(50),
          MotherAccountForm(),
          VerticalSpace(25),
        ],
      ),
    );
  }
}
