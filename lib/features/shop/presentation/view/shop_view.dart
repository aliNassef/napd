import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});
  static const routeName = 'shop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'shop'.tr(),
      ),
      body: SafeArea(
        child: ShopViewBody(),
      ),
    );
  }
}
