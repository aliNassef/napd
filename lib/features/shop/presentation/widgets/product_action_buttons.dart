import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/view/checkout_view.dart';
import 'package:napd/features/shop/presentation/widgets/style_actionButton.dart';

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
            label: "checkout".tr(),
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
            label: "addtocart".tr(),
            isElevated: false,
            onPressed: () => _showSuccessDialog(context),
          ),
        ),
      ],
    );
  }
}
