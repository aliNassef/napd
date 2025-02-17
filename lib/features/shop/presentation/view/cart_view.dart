import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/widgets/appbars/custom_app_bar.dart';

import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const String routeName = 'cart';

  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'cart'.tr(),
      ),
      body: SafeArea(
        bottom: false,
        child: CartViewBody().withAllPadding(16),
      ),
    );
  }
}
