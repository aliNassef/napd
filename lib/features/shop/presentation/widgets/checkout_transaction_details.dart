import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

Widget transactionDetail(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
    child: Row(
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
    ),
  );
}
