import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../cubit/sign_up_cubit.dart';
import '../../../../core/widgets/background_widget.dart';

import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<SignupCubit>(),
        child: BackgroundWidget(
          child: SafeArea(
            bottom: false,
            child: SignupViewBody(),
          ),
        ),
      ),
    );
  }
}
