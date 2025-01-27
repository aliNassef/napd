import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/default_app_button.dart';

class CryTranslatorStartButton extends StatelessWidget {
  const CryTranslatorStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultAppButton(
      text: "start button".tr(),
      onPressed: () {
        // Add your action here
      },
      backgroundColor: AppColors.secondaryColor,
      textColor: AppColors.primaryColor,
      padding: 52,
    );
  }
}
