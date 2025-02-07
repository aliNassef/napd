
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BabyInfoRow extends StatelessWidget {
  const BabyInfoRow({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.roboto24Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        Text(
          value,
          style: AppStyles.roboto20Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
      ],
    );
  }
}