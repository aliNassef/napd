import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
            text: 'I don’t have account!',
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
            text: 'Sign up',
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
