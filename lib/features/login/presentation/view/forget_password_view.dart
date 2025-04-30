import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:napd/core/utils/app_styles.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/core/widgets/custom_text_form_field.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:napd/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/widgets/spacers.dart';
import '../cubit/login_state.dart';
import 'reset_password_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forgetPasswordView';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

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
                    AppStrings.resetYourPassword,
                    style: AppStyles.roboto40SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  VerticalSpace(20),
                  Text(
                    AppStrings.weHaveSendRestCode,
                    style: AppStyles.roboto20Regular.copyWith(
                      color: AppColors.greyColor.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  VerticalSpace(57),
                  CustomTextFormField(
                    hintText: AppStrings.email,
                    controller: _emailController,
                  ),
                  VerticalSpace(32),
                  BlocConsumer<LoginCubit, LoginState>(
                    listenWhen: (previous, current) =>
                        current is SendCodeSuccessState ||
                        current is SendCodeFailureState ||
                        current is SendCodeLoadingState,
                    listener: (_, state) {
                      if (state is SendCodeSuccessState) {
                        Navigator.pushNamed(
                          context,
                          ResetPasswordView.routeName,
                          arguments: _emailController.text,
                        );
                      }
                      if (state is SendCodeFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errMessage),
                          ),
                        );
                      }
                    },
                    builder: (context, state) => DefaultAppButton(
                      backgroundColor: AppColors.greyColor,
                      textColor: AppColors.darkBlueColor,
                      text: state is SendCodeLoadingState
                          ? 'Loading...'
                          : AppStrings.sendCode,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .sendCode(email: _emailController.text.trim());
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
