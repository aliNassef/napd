import 'package:flutter/material.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';

import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const String routeName = 'cart';

  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.cart,
      ),
      body: SafeArea(
        bottom: false,
        child: CartViewBody().withAllPadding(16),
      ),
    );
  }
}
