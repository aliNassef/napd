import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

import 'baby_gender_selector.dart';

class BabyAccountViewBody extends StatelessWidget {
  const BabyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpace(30),
        Text(
          "createbabyaccount".tr(),
          style: AppStyles.roboto40Bold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(40),
        CustomTextFormField(
          hintText: "name".tr(),
          controller: TextEditingController(),
        ),
        VerticalSpace(28),
        CustomTextFormField(
          hintText: "age".tr(),
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
        ),
        VerticalSpace(28),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: "weight".tr(),
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
              ),
            ),
            HorizantalSpace(50),
            Expanded(
              child: CustomTextFormField(
                hintText: "height".tr(),
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
          text: "finish".tr(),
          onPressed: () {},
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
        VerticalSpace(10),
        DefaultAppButton(
          text: "addbaby".tr(),
          onPressed: () {},
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
      ],
    );
  }
}
