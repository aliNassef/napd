import 'package:flutter/material.dart';

import '../widgets/shop_view_app_bar.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(),
    );
  }
}
