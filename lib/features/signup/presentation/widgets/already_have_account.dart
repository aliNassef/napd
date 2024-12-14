import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      TextSpan(
        children: [
          TextSpan(
            text: 'Already have account!',
            style: AppStyles.textStyle24R.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, LoginView.routeName);
              },
            text: 'Login',
            style: AppStyles.textStyle24R.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
