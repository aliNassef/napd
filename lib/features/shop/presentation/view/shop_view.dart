import 'package:flutter/material.dart';
import 'package:napd/core/widgets/custom_app_bar.dart';
import '../widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Shop',
      ),
      body: SafeArea(
        child: ShopViewBody(),
      ),
    );
  }
}
