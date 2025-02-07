import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';

import 'package:napd/core/widgets/custom_app_bar.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/view/checkout_view.dart';
import 'package:napd/features/shop/presentation/widgets/cart_item.dart';
import 'package:napd/features/shop/presentation/widgets/cart_total_selection.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';

  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'cart',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CartItem();
                  },
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 22,
                endIndent: 22,
              ),
              CartTotalSection(
                label: "Order total:",
                amount: "\$26.99",
              ),
              VerticalSpace(22),
              DefaultAppButton(
                text: "checkout".tr(),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CheckoutView.routeName,
                  );
                },
                backgroundColor: AppColors.darkBlueColor,
                textColor: AppColors.greyColor,
                padding: 50,
              ),
              VerticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
