import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        RatingBarIndicator(
          rating: 3.5,
          unratedColor: AppColors.greyColor,
          itemBuilder: (_, index) {
            return Icon(
              Icons.star,
              size: 24,
              color: Color(0xffF6D060),
            );
          },
          itemSize: 24,
          itemCount: 5,
        ),
      ],
    );
  }
}
