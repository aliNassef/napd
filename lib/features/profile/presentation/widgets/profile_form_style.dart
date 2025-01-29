import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/spacers.dart';

class ProfileFormStyle extends StatelessWidget {
  const ProfileFormStyle(
      {super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.roboto24Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(16),
        CustomTextFormField(
          keyboardType: TextInputType.name,
          hintColor: AppColors.darkBlueColor,
          isFilled: true,
          fillColor: Color(0xffEAE8E8),
          hintText: hintText,
          controller: TextEditingController(),
        ),
        VerticalSpace(30),
      ],
    );
  }
}
