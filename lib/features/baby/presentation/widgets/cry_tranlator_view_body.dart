import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_images.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import 'custom_rounded_app_bar.dart';

class CryTranslatorViewBody extends StatelessWidget {
  const CryTranslatorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomRoundedAppBar(
            title: "cry translator title".tr(),
          ),
          VerticalSpace(50),
          Text(
            "translate your baby's cry".tr(),
            style: AppStyles.roboto32Bold.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Image.asset(
            AppImages.babyCry,
            height: context.height * 0.60,
            width: context.width,
            fit: BoxFit.cover,
          ),
          VerticalSpace(16),
          DefaultAppButton(
            text: "start button".tr(),
            onPressed: () {
              // Add your action here
            },
            backgroundColor: AppColors.secondaryColor,
            textColor: AppColors.primaryColor,
            padding: 52,
          ),
        ],
      ).withHorizontalPadding(8),
    );
  }
}
