import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import '../widgets/baby_account_view_body.dart';

class BabyAccountView extends StatelessWidget {
  static const String routeName = 'babyAccount';

  const BabyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: BabyAccountViewBody(),
        ),
      ),
    );
  }
}
