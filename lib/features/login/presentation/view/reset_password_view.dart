import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/functions/show_error_message.dart';
import 'package:napd/core/functions/show_loading_box.dart';
import 'package:napd/features/login/presentation/cubit/login_cubit.dart';
import 'package:napd/features/login/presentation/cubit/login_state.dart';
import 'package:napd/features/login/presentation/view/login_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/background_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email});
  static const String routeName = 'resetPasswordView';

  final String email;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController _codeController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  VerticalSpace(50),
                  Text(
                    AppStrings.newPassword,
                    style: AppStyles.roboto40SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  VerticalSpace(20),
                  Text(
                    AppStrings.goodNews,
                    style: AppStyles.roboto20Regular.copyWith(
                      color: AppColors.greyColor.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  VerticalSpace(57),
                  CustomTextFormField(
                    hintText: AppStrings.password,
                    controller: _passwordController,
                  ),
                  VerticalSpace(16),
                  CustomTextFormField(
                    hintText: AppStrings.code,
                    controller: _codeController,
                  ),
                  VerticalSpace(32),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is ResetPasswordSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      }
                      if (state is ResetPasswordFailureState) {
                        showErrorMessage(context, errMessage: state.errMessage);
                      }
                      if (state is ResetPasswordLoadingState) {
                        showLoadingBox(context);
                      }
                    },
                    child: DefaultAppButton(
                      backgroundColor: AppColors.greyColor,
                      textColor: AppColors.darkBlueColor,
                      text: AppStrings.confirm,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().resetPassword(
                                email: widget.email.trim(),
                                password: _passwordController.text.trim(),
                                code: _codeController.text.trim(),
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
