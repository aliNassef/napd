import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';

import '../widgets/select_baby_account_view_body.dart';

class SelectBabyAccountView extends StatelessWidget {
  const SelectBabyAccountView({super.key});
  static const routeName = 'SelectBabyAccountView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: SelectBabyAccountViewBody(),
        ),
      ),
    );
  }
}
