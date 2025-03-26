import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CheckoutTransactionDetails extends StatelessWidget {
  const CheckoutTransactionDetails({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
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
          style: AppStyles.roboto18Medium.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
      ],
    );
  }
}
