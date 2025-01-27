import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class AddBabyTitle extends StatelessWidget {
  const AddBabyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "add your baby".tr(),
      style: AppStyles.roboto48Bold.copyWith(
        color: AppColors.greyColor,
      ),
    );
  }
}
