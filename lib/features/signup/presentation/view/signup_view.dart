import 'package:flutter/material.dart'; 
import '../../../../core/widgets/background_widget.dart';

import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: SignupViewBody(),
        ),
      ),
    );
  }
} 