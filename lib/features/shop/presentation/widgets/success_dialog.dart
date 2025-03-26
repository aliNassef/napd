import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/cart_view.dart';
import 'dialog_action_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 340),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.08,
          horizontal: screenWidth * 0.09,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.secondaryColor,
              size: 36,
            ),
            SizedBox(height: screenWidth * 0.04),
            Text(
              AppStrings.itemAddedSuccessfully,
              style: AppStyles.roboto18SemiBold.copyWith(
                color: AppColors.secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth * 0.06),
            DialogActionButtons(
              onContinueShopping: () {
                Navigator.pop(context);
              },
              onGoToCart: () {
                Navigator.pushNamed(
                  context,
                  CartView.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
