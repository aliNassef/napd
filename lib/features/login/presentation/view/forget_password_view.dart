import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/core/widgets/custom_text_form_field.dart';
import 'package:napd/core/widgets/default_app_button.dart';

import '../../../../core/widgets/spacers.dart';
import 'reset_password_view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forgetPasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace(50),
                Text(
                  AppStrings.resetYourPassword,
                  style: AppStyles.roboto40SemiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                VerticalSpace(20),
                Text(
                  AppStrings.weHaveSendRestCode,
                  style: AppStyles.roboto20Regular.copyWith(
                    color: AppColors.greyColor.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
                VerticalSpace(57),
                CustomTextFormField(
                  hintText: AppStrings.email,
                  controller: TextEditingController(),
                ),
                VerticalSpace(32),
                DefaultAppButton(
                  backgroundColor: AppColors.greyColor,
                  textColor: AppColors.darkBlueColor,
                  text: AppStrings.sendCode,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ResetPasswordView.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
