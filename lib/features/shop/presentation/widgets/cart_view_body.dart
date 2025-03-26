import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../view/thanks_view.dart';
import 'cart_item.dart';
import 'cart_total_selection.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: VerticalSpace(20),
        ),
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
                text: AppStrings.checkout,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ThanksView.routeName,
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
