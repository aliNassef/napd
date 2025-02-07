import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/widgets/cart_total_selection.dart';
import 'package:napd/features/shop/presentation/widgets/checkout_transaction_details.dart';
import 'package:napd/features/shop/presentation/widgets/style_actionButton.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.secondaryColor,
            size: 80,
          ),
          VerticalSpace(14),
          Text(
            "Thank you!",
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          VerticalSpace(18),
          Text(
            "Your transaction was successful",
            style: AppStyles.roboto20Regular.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ),
          VerticalSpace(20),
          transactionDetail("Date", "01/24/2023"),
          transactionDetail("Time", "10:15 AM"),
          transactionDetail("To", "Sam Louis"),
          VerticalSpace(14),
          Divider(height: 30, thickness: 1),
          CartTotalSection(
            label: "Total",
            amount: "\$50.97",
          ),
          VerticalSpace(70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: StyledActionButton(
                  label: "Print",
                  isElevated: true,
                  onPressed: () {},
                ),
              ),
              HorizantalSpace(30),
              Expanded(
                child: StyledActionButton(
                  label: "Okay",
                  isElevated: false,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
