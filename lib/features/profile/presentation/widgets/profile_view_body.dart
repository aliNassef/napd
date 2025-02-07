import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            title: 'fullname'.tr(),
            hintText: 'Ali Nassef',
          ),
          ProfileFormStyle(
            title: 'phonenumber'.tr(),
            hintText: '01000000000',
          ),
          ProfileFormStyle(
            title: 'email'.tr(),
            hintText: 'xGj0E@example.com',
          ),
          ProfileFormStyle(
            title: 'dateofbirth'.tr(),
            hintText: '13 / 11 / 2002',
          ),
          DefaultAppButton(
            padding: 40.w,
            text: 'updateprofile'.tr(),
            backgroundColor: AppColors.darkBlueColor,
            textColor: Colors.white,
          ),
          VerticalSpace(20),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
