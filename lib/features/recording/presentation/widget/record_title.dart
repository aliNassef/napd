import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class RecordTitle extends StatelessWidget {
  const RecordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'record'.tr(),
      style: AppStyles.roboto40Bold.copyWith(
        color: AppColors.secondaryColor,
      ),
    );
  }
}
