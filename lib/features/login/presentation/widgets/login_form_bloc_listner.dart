import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/functions/show_error_message.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:napd/features/login/data/model/login_input_model.dart';
import '../../../../core/functions/show_loading_box.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

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
  dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: AppStrings.email,
            controller: _emailController,
          ),
          VerticalSpace(30),
          CustomTextFormField(
            isPassword: true,
            hintText: AppStrings.password,
            controller: _passController,
          ),
          VerticalSpace(60),
          BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current is LoginLoading ||
                current is LoginFailure ||
                current is LoginSuccess,
            listener: (context, state) {
              if (state is LoginLoading) {
                showLoadingBox(context);
              }

              if (state is LoginFailure) {
                Navigator.pop(context);
                showErrorMessage(context, errMessage: state.errMessage);
              }
              if (state is LoginSuccess) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  SelectBabyAccountView.routeName,
                  arguments: state.babies,
                );
              }
            },
            child: DefaultAppButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var loginEntity = LoginInputModel(
                    email: _emailController.text.trim(),
                    password: _passController.text.trim(),
                  );
                  context.read<LoginCubit>().login(loginEntity);
                } else {
                  _autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              backgroundColor: Colors.white,
              text: AppStrings.logIn,
              textColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
