import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../data/model/signup_input_model.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/create_baby_account_view_body.dart';

class CreateBabyAccountView extends StatelessWidget {
  static const String routeName = 'babyAccount';

  const CreateBabyAccountView({
    super.key,
    required this.motherInfo,
  });
  final SignupInputModel motherInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<SignupCubit>(),
        child: BackgroundWidget(
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: CreatebabyAccountViewBody(
                motherInfo: motherInfo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
