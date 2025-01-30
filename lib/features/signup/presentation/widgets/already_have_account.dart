import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:napd/features/login/presentation/view/login_view.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_styles.dart';

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
            text: 'Login',
            style: AppStyles.roboto24Regular.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
