import 'package:flutter/material.dart';
import 'package:napd/core/models/baby_model.dart';
import '../../../../core/widgets/background_widget.dart';

import '../widgets/select_baby_account_view_body.dart';

class SelectBabyAccountView extends StatelessWidget {
  const SelectBabyAccountView({super.key, required this.babies});
  final List<BabyModel> babies;
  static const routeName = 'SelectBabyAccountView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: SelectBabyAccountViewBody(
            babies: babies,
          ),
        ),
      ),
    );
  }
}
