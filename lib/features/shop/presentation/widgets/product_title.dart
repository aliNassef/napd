import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Children's cube toy",
      style: AppStyles.roboto30Medium.copyWith(
        color: AppColors.darkBlueColor,
      ),
    );
  }
}
