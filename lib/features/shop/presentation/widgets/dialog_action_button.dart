import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/extensions/mediaquery_size.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';

class DialogActionButtons extends StatelessWidget {
  final VoidCallback onContinueShopping;
  final VoidCallback onGoToCart;

  const DialogActionButtons({
    super.key,
    required this.onContinueShopping,
    required this.onGoToCart,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth * 0.65,
          child: OutlinedButton(
            onPressed: onContinueShopping,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
              side: const BorderSide(color: AppColors.darkBlueColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "continueshopping".tr(),
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkBlueColor,
              ),
            ),
          ),
        ),
        VerticalSpace(screenWidth * 0.03),
        SizedBox(
          width: screenWidth * 0.65,
          child: ElevatedButton(
            onPressed: onGoToCart,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
              backgroundColor: AppColors.darkBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "gotocart".tr(),
              style: AppStyles.roboto16Regular.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
