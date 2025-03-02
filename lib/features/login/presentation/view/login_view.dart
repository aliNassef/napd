import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../cubit/login_cubit.dart';

import '../../../../core/widgets/background_widget.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<LoginCubit>(),
        child: BackgroundWidget(
          child: SafeArea(
            bottom: false,
            child: LoginViewBody(),
          ),
        ),
      ),
    );
  }
}
