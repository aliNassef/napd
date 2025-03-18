import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/checkout_view.dart';
import 'style_actionButton.dart';

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
          child: StyledActionButton(
            label:AppStrings.checkout,
            isElevated: true,
            onPressed: () {
              Navigator.pushNamed(
                context,
                CheckoutView.routeName,
              );
            },
          ),
        ),
        HorizantalSpace(30),
        Expanded(
          child: StyledActionButton(
            label: AppStrings.addToCart,
            isElevated: false,
            onPressed: () => _showSuccessDialog(context),
          ),
        ),
      ],
    );
  }
}
