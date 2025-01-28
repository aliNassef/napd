import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';

class PriceAndRating extends StatelessWidget {
  const PriceAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$75.000',
          style: AppStyles.roboto20SemiBold.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        Row(
          children: List.generate(
            5,
            (index) => const Icon(Icons.star, color: Colors.amber, size: 24),
          ),
        ),
      ],
    );
  }
}
