import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';
import '../widgets/create_baby_account_view_body.dart';

class CreateBabyAccountView extends StatelessWidget {
  static const String routeName = 'babyAccount';

  const CreateBabyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: CreatebabyAccountViewBody(),
          ),
        ),
      ),
    );
  }
}
