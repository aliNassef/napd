
import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        Text(
          subTitle,
          style: AppStyles.roboto14Regular.copyWith(
            color: AppColors.greenLightColor,
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
