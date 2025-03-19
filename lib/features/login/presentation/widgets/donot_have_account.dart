import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../signup/presentation/view/signup_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.doNotHaveAccount,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: AppStrings.signUp,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
