import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/functions/toast_dialog.dart';
import 'package:napd/features/login/domain/entity/login_entity.dart';
import 'package:napd/features/login/presentation/cubit/login_cubit.dart';
import 'package:napd/features/login/presentation/cubit/login_state.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';

import '../../../../core/widgets/spacers.dart';

import '../view/select_baby_account_view.dart';

class LoginFormBlocListner extends StatefulWidget {
  const LoginFormBlocListner({super.key});

  @override
  State<LoginFormBlocListner> createState() => _LoginFormBlocListnerState();
}

class _LoginFormBlocListnerState extends State<LoginFormBlocListner> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late AutovalidateMode _autovalidateMode;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            controller: _emailController,
          ),
          VerticalSpace(30),
          CustomTextFormField(
            isPassword: true,
            hintText: 'Password',
            controller: _passController,
          ),
          VerticalSpace(60),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {}

              if (state is LoginFailure) {
                showToast(text: state.errMessage);
              }
              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  SelectBabyAccountView.routeName,
                );
              }
            },
            child: DefaultAppButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var loginEntity = LoginEntity(
                    email: _emailController.text.trim(),
                    pass: _passController.text.trim(),
                  );
                  // call cubit
                  context.read<LoginCubit>().login(loginEntity);
                } else {
                  _autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              backgroundColor: Colors.white,
              text: 'Log in',
              padding: context.width * 0.2,
              textColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
