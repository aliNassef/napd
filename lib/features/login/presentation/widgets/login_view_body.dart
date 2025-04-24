import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'login_form_bloc_listner.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/another_way_sign.dart';
import '../../../../core/widgets/social_media_list_items.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import 'donot_have_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            AppStrings.welcomeMessage,
            style: AppStyles.roboto48Bold.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(32),
          Text(
            AppStrings.logIn,
            style: AppStyles.roboto32Bold.copyWith(
              color: Colors.white,
            ),
          ),
          VerticalSpace(42),
          LoginFormBlocListner(),
          VerticalSpace(60),
          AnotherWaySign(
            title: AppStrings.orLoginWith,
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
              AppStrings.forgotPassword,
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