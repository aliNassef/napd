import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/shop/presentation/widgets/cart_item.dart';
import 'package:napd/features/shop/presentation/widgets/cart_total_selection.dart';
import 'package:napd/features/shop/presentation/widgets/style_actionButton.dart';

// Presentation Layer
class CartView extends StatelessWidget {
  static const String routeName = '/cart';

  CartView({super.key});
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
                color: Colors.grey, // لون الخط
                thickness: 2, // سمك الخط
                indent: 22, // المسافة من بداية الخط
                endIndent: 22, // المسافة من نهاية الخط
              ),
              CartTotalSection(),
              VerticalSpace(22),
              DefaultAppButton(
                text: "checkout".tr(),
                onPressed: () {},
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
