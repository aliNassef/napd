import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/default_app_button.dart';

class CryTranslatorStartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultAppButton(
      text: "Start",
      onPressed: () {
        // Add your action here
      },
      backgroundColor: AppColors.secondaryColor,
      textColor: AppColors.primaryColor,
      padding: 52,
    );
  }
}
