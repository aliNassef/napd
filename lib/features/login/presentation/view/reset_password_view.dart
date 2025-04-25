import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String routeName = 'resetPasswordView';
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
                  AppStrings.newPassword,
                  style: AppStyles.roboto40SemiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                VerticalSpace(20),
                Text(
                  AppStrings.goodNews,
                  style: AppStyles.roboto20Regular.copyWith(
                    color: AppColors.greyColor.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
                VerticalSpace(57),
                CustomTextFormField(
                  hintText: AppStrings.password,
                  controller: TextEditingController(),
                ),
                VerticalSpace(32),
                DefaultAppButton(
                  backgroundColor: AppColors.greyColor,
                  textColor: AppColors.darkBlueColor,
                  text: AppStrings.confirm,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
