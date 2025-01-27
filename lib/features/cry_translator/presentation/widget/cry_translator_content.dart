import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'cry_translation_image.dart';
import 'cry_translator_button.dart';
import 'cry_translator_subtitle.dart';

class CryTranslatorContent extends StatelessWidget {
  const CryTranslatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomRoundedAppBar(
          title: "cry translator title".tr(),
        ),
        VerticalSpace(50),
        CryTranslatorSubtitle(),
        CryTranslatorImage(),
        CryTranslatorStartButton(),
      ],
    );
  }
}

class CustomRoundedAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomRoundedAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.secondaryColor, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onBackPressed ?? () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 38,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Text(
            title,
            style: AppStyles.roboto24Bold.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
