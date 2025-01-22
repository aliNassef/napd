import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CryTranslatorSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Translate your baby's cry",
      style: AppStyles.textStyle26B.copyWith(
        color: AppColors.secondaryColor,
      ),
    );
  }
}
