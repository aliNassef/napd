import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'cart_total_selection.dart';
import 'checkout_transaction_details.dart';
import 'custom_outline_button.dart';

class ThanksViewBody extends StatelessWidget {
  const ThanksViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(39),
        Icon(
          Icons.check_circle,
          color: AppColors.secondaryColor,
          size: 80,
        ),
        VerticalSpace(39),
        Text(
          AppStrings.thankYou,
          style: AppStyles.roboto32Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(39),
        Text(
          AppStrings.paymentDone,
          style: AppStyles.roboto24Regular.copyWith(
            color: AppColors.darkBlueColor,
          ),
        ),
        VerticalSpace(39),
        CheckoutTransactionDetails(
          title: AppStrings.date,
          subTitle: "123456789",
        ),
        VerticalSpace(20),
        CheckoutTransactionDetails(
          title: AppStrings.time,
          subTitle: "123456789",
        ),
        VerticalSpace(20),
        CheckoutTransactionDetails(
          title: AppStrings.to,
          subTitle: "123456789",
        ),
        VerticalSpace(20),
        CheckoutTransactionDetails(
          title: AppStrings.address,
          subTitle: "123456789",
        ),
        VerticalSpace(20),
        CheckoutTransactionDetails(
          title: AppStrings.phone,
          subTitle: "123456789",
        ),
        VerticalSpace(39),
        Divider(height: 30, thickness: 1),
        CartTotalSection(
          label: AppStrings.total,
          amount: "\$50.97",
        ),
        VerticalSpace(39),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: DefaultAppButton(
                text: AppStrings.print,
                backgroundColor: AppColors.darkBlueColor,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            HorizantalSpace(30),
            Expanded(
              child: CustomOutllineButton(
                text: AppStrings.okay,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
