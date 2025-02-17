import 'package:flutter/material.dart';

import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = 'checkout';
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CheckoutViewBody(),
      ),
    );
  }
}
