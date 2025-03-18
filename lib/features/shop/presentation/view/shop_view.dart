import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../../core/widgets/appbars/custom_app_bar.dart';
import '../widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static const routeName = 'shop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.shop,
      ),
      body: SafeArea(
        child: ShopViewBody(),
      ),
    );
  }
}
