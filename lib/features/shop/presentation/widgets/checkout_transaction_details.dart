import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

Widget transactionDetail(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppStyles.roboto18Regular.copyWith(
          color: AppColors.darkBlueColor,
        ),
      ),
      Text(
        value,
        style: AppStyles.roboto18Regular.copyWith(
          color: AppColors.darkBlueColor,
        ),
      ),
    ],
  ).withVerticalPadding(8).withHorizontalPadding(30);
}
