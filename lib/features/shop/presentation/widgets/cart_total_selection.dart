import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CartTotalSection extends StatelessWidget {
  final String label;
  final String amount;

  const CartTotalSection(
      {super.key, required this.label, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.roboto24SemiBold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        Text(
          amount,
          style: AppStyles.roboto24SemiBold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
      ],
    );
  }
}
