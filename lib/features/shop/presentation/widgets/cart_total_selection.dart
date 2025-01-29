import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class CartTotalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Order total:",
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          Text(
            "\$26.99",
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
