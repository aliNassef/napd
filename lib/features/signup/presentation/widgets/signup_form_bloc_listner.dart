import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/build_error_message.dart';
import '../../domain/entity/signup_input_entity.dart';
import '../cubit/sign_up_cubit.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_check_box.dart';

class SignUpFormBlocListner extends StatefulWidget {
  const SignUpFormBlocListner({super.key});

  @override
  State<SignUpFormBlocListner> createState() => _SignUpFormBlocListnerState();
}

class _SignUpFormBlocListnerState extends State<SignUpFormBlocListner> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  late AutovalidateMode _autovalidateMode;
  late bool remember;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'first name',
                  controller: _firstNameController,
                ),
              ),
              HorizantalSpace(50),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'last name',
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          VerticalSpace(28),
          CustomTextFormField(
            hintText: 'Email',
            controller: _emailController,
          ),
          VerticalSpace(28),
          CustomTextFormField(
            hintText: 'Phone Number',
            controller: _phoneNumberController,
          ),
          VerticalSpace(28),
          CustomTextFormField(
            isPassword: true,
            hintText: 'Password',
            controller: _passwordController,
          ),
          VerticalSpace(25),
          Row(
            children: [
              CustomCheckBox(
                onChanged: (val) {
                  setState(() {
                    remember = val;
                  });
                },
              ),
              Text(
                'Remember me',
                style: AppStyles.roboto20Regular.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          VerticalSpace(22),
          BlocListener<SignupCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.pop(context);
              }

              if (state is SignUpFailure) {
                showErrorMessage(context, errMessage: state.errMessage);
              }
              if (state is SignUpLoading) {}
            },
            child: DefaultAppButton(
              onPressed: () => _checkSignUpButtonValidity(context),
              padding: context.width * 0.2,
              text: 'Sign up',
              backgroundColor: Colors.white,
              textColor: AppColors.darkBlueColor,
            ),
          ),
        ],
      ),
    );
  }

  void _checkSignUpButtonValidity(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var signUpInputEntity = SignupInputEntity(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        password: _passwordController.text.trim(),
        email: _emailController.text.trim(),
        isRemembered: remember,
      );

      // call cubit
      context.read<SignupCubit>().signup(signUpInputEntity);
    } else {
      _autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
