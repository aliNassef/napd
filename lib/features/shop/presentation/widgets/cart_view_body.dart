import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';

import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/view/checkout_view.dart';
import 'package:napd/features/shop/presentation/widgets/cart_item.dart';
import 'package:napd/features/shop/presentation/widgets/cart_total_selection.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemBuilder: (_, index) {
            return CartItem();
          },
          separatorBuilder: (_, __) => VerticalSpace(8),
          itemCount: 5,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 22,
                endIndent: 22,
                height: 28,
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
              VerticalSpace(20),
            ],
          ),
        ),
      ],
    );
  }
}
