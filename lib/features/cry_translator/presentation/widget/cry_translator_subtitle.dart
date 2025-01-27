import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CryTranslatorSubtitle extends StatelessWidget {
  const CryTranslatorSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "translate your baby's cry".tr(),
      style: AppStyles.roboto26Bold.copyWith(
        color: AppColors.secondaryColor,
      ),
    );
  }
}
