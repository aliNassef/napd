import 'package:flutter/material.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/another_way_sign.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/social_media_list_items.dart';
import '../../../../core/widgets/spacers.dart';

import '../../../../core/utils/app_styles.dart';
import '../view/select_baby_account_view.dart';
import 'donot_have_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Welcome again to MamaCare',
            style: AppStyles.roboto48Bold.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(32),
          Text(
            'Log in',
            style: AppStyles.roboto32Bold.copyWith(
              color: Colors.white,
            ),
          ),
          VerticalSpace(42),
          CustomTextFormField(
            hintText: 'Email',
            controller: TextEditingController(),
          ),
          VerticalSpace(30),
          CustomTextFormField(
            isPassword: true,
            hintText: 'Password',
            controller: TextEditingController(),
          ),
          VerticalSpace(60),
          DefaultAppButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                SelectBabyAccountView.routeName,
              );
            },
            backgroundColor: Colors.white,
            text: 'Log in',
            padding: context.width * 0.2,
            textColor: AppColors.primaryColor,
          ),
          VerticalSpace(60),
          AnotherWaySign(
            title: 'Or Login with',
          ),
          VerticalSpace(22),
          SocialMediaListItems(),
          VerticalSpace(22),
          Divider(
            color: AppColors.greyColor.withValues(alpha: 0.8),
            height: 1,
            thickness: 1,
          ),
          VerticalSpace(22),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppStyles.roboto24Regular.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          VerticalSpace(24),
          DonotHaveAccount(),
          VerticalSpace(24),
        ],
      ),
    );
  }
}
