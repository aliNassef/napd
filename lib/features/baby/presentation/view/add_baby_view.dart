import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import 'add_baby_view_body.dart';

class AddBabyView extends StatelessWidget {
  static const String routeName = 'addBaby';
  const AddBabyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: AddBabyViewBody(),
        ),
      ),
    );
  }
}
