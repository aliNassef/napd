import 'package:flutter/material.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/features/baby_account/presentation/widget/baby_form.dart';

class BabyAccountView extends StatelessWidget {
  static const String routeName = '/babyAccount';

  const BabyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: BabyForm(),
        ),
      ),
    );
  }
}
