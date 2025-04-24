import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/view/login_view.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.alreadyHaveAccount,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, LoginView.routeName);
              },
            text: AppStrings.login,
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
