import 'package:flutter/material.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

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
              AppStrings.continueShopping,
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
             AppStrings.goToCart,
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
