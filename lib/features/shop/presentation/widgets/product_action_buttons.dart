import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/features/shop/presentation/widgets/custom_outline_button.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/thanks_view.dart';

import 'success_dialog.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultAppButton(
            onPressed: () {
              Navigator.pushNamed(context, ThanksView.routeName);
            },
            text: AppStrings.checkout,
            backgroundColor: AppColors.darkBlueColor,
            textColor: Colors.white,
          ),
        ),
        HorizantalSpace(30),
        Expanded(
          child: CustomOutllineButton(
            text: AppStrings.addToCart,
            onPressed: () => _showSuccessDialog(context),
          ),
        ),
      ],
    );
  }
}
