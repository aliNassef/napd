import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

import 'profile_form_style.dart';
import 'profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(24),
          Align(
            alignment: Alignment.center,
            child: ProfileImage(),
          ),
          VerticalSpace(24),
          ProfileFormStyle(
            title: AppStrings.fullName,
            hintText: 'Ali Nassef',
          ),
          ProfileFormStyle(
            title: AppStrings.phoneNumber,
            hintText: '01000000000',
          ),
          ProfileFormStyle(
            title: AppStrings.email,
            hintText: 'xGj0E@example.com',
          ),
          ProfileFormStyle(
            title: AppStrings.dateOfBirth,
            hintText: '13 / 11 / 2002',
          ),
          DefaultAppButton(
            text: AppStrings.updateProfile,
            backgroundColor: AppColors.darkBlueColor,
            textColor: Colors.white,
          ),
          VerticalSpace(20),
          DefaultAppButton(
            backgroundColor: Color(0xffF9E9FC),
            text: AppStrings.logout,
            textColor: AppColors.darkBlueColor,
          ),
          VerticalSpace(20),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
