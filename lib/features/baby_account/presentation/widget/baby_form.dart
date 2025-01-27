import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/custom_text_form_field.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';

import 'gender_selector.dart';

class BabyForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  BabyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "create Baby Account".tr(),
          style: AppStyles.roboto32Bold.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        VerticalSpace(40),
        CustomTextFormField(
          hintText: "name".tr(),
          controller: nameController,
        ),
        VerticalSpace(30),
        CustomTextFormField(
          hintText: "age".tr(),
          controller: ageController,
          keyboardType: TextInputType.number,
        ),
        VerticalSpace(30),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: "weight".tr(),
                controller: weightController,
                keyboardType: TextInputType.number,
              ),
            ),
            HorizantalSpace(50),
            Expanded(
              child: CustomTextFormField(
                hintText: "height".tr(),
                controller: heightController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        VerticalSpace(40),
        GenderSelector(),
        VerticalSpace(30),
        DefaultAppButton(
          text: "finish".tr(),
          onPressed: () {},
          backgroundColor: AppColors.secondaryColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
        VerticalSpace(20),
        DefaultAppButton(
          text: "add Baby".tr(),
          onPressed: () {},
          backgroundColor: AppColors.greyColor,
          textColor: AppColors.primaryColor,
          padding: 40,
        ),
      ],
    );
  }
}
