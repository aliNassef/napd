import 'package:flutter/material.dart';
import 'package:napd/features/login/presentation/view/login_view.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/another_way_sign.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/social_media_list_items.dart';
import '../../../../core/widgets/spacers.dart';

import 'already_have_account.dart';
import '../../../baby/presentation/widgets/baby_gender_selector.dart';

class CreatebabyAccountViewBody extends StatelessWidget {
  const CreatebabyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(30),
        Text(
          AppStrings.createBabyAccount,
          style: AppStyles.roboto40Bold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(40),
        CustomTextFormField(
          hintText: AppStrings.name,
          controller: TextEditingController(),
        ),
        VerticalSpace(28),
        CustomTextFormField(
          hintText: AppStrings.age,
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
        ),
        VerticalSpace(28),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: AppStrings.weight,
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
            ),
            HorizantalSpace(50),
            Expanded(
              child: CustomTextFormField(
                hintText: AppStrings.height,
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        VerticalSpace(40),
        BabyGenderSelector(),
        VerticalSpace(50),
        DefaultAppButton(
          text: AppStrings.addBaby,
          onPressed: () {},
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
        VerticalSpace(10),
        DefaultAppButton(
          text: AppStrings.signUp,
          onPressed: () {
            Navigator.pushNamed(context, LoginView.routeName);
          },
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
        VerticalSpace(30),
        AnotherWaySign(
          title: AppStrings.orRegisterWith,
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
        Center(child: AlreadyHaveAccount()),
        VerticalSpace(22),
      ],
    );
  }
}
