import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/mediaquery_size.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../core/widgets/default_app_button.dart';
import '../../../../../../../core/widgets/spacers.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../core/widgets/another_way_sign.dart';
import '../../../../../../../core/widgets/custom_check_box.dart';
import '../../../../../../../core/widgets/social_media_list_items.dart';
import 'already_have_account.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Create account ',
            style: AppStyles.roboto48Bold.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          VerticalSpace(35),
          Text(
            'Sign up to get started',
            style: AppStyles.roboto20Regular.copyWith(
              color: AppColors.greyColor.withValues(alpha: 0.6),
            ),
          ),
          VerticalSpace(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'first name',
                  controller: TextEditingController(),
                ),
              ),
              HorizantalSpace(50),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'last name',
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          VerticalSpace(28),
          CustomTextFormField(
            hintText: 'Email',
            controller: TextEditingController(),
          ),
          VerticalSpace(28),
          CustomTextFormField(
            isPassword: true,
            hintText: 'Password',
            controller: TextEditingController(),
          ),
          VerticalSpace(25),
          Row(
            children: [
              CustomCheckBox(),
              Text(
                'Remember me',
                style: AppStyles.roboto20Regular.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          VerticalSpace(22),
          DefaultAppButton(
            onPressed: () {},
            padding: context.width * 0.2,
            text: 'Sign up',
            backgroundColor: Colors.white,
            textColor: AppColors.darkBlueColor,
          ),
          VerticalSpace(25),
          AnotherWaySign(
            title: 'Or Register with',
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
          AlreadyHaveAccount(),
          VerticalSpace(22),
        ],
      ),
    );
  }
}
