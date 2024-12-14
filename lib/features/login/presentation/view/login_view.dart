import 'package:flutter/material.dart';
import '../../../../core/widgets/background_widget.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}