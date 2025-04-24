import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/layout/presentation/view/layout_view.dart';
import 'package:napd/features/signup/data/model/signup_input_model.dart';
import 'package:napd/features/signup/presentation/cubit/sign_up_cubit.dart';
import '../../../../core/functions/show_error_message.dart';
import '../../../../core/functions/show_loading_box.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/another_way_sign.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/social_media_list_items.dart';
import '../../../../core/widgets/spacers.dart';

import 'already_have_account.dart';
import '../../../baby/presentation/widgets/baby_gender_selector.dart';

class CreatebabyAccountViewBody extends StatefulWidget {
  const CreatebabyAccountViewBody({super.key, required this.motherInfo});
  final SignupInputModel motherInfo;

  @override
  State<CreatebabyAccountViewBody> createState() =>
      _CreatebabyAccountViewBodyState();
}

class _CreatebabyAccountViewBodyState extends State<CreatebabyAccountViewBody> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  late int _gender;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(30),
          Text(
            AppStrings.createBabyAccount,
            style: AppStyles.roboto40Bold.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          VerticalSpace(40),
          CustomTextFormField(
            hintText: AppStrings.name,
            controller: _nameController,
          ),
          VerticalSpace(28),
          CustomTextFormField(
            hintText: AppStrings.age,
            controller: _ageController,
            keyboardType: TextInputType.text,
          ),
          VerticalSpace(40),
          BabyGenderSelector(
            onChanged: (val) {
              setState(() {
                _gender = val;
              });
            },
          ),
          VerticalSpace(50),
          BlocListener<SignupCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Navigator.pushReplacementNamed(context, LayoutView.routeName);
              }
              if (state is SignUpFailure) {
                Navigator.pop(context);
                showErrorMessage(
                  context,
                  errMessage: state.errMessage,
                );
              }
              if (state is SignUpLoading) {
                showLoadingBox(context);
              }
            },
            child: DefaultAppButton(
              text: AppStrings.signUp,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var signupInputModel = SignupInputModel(
                    babyName: _nameController.text.trim(),
                    email: widget.motherInfo.email,
                    birthDate: _ageController.text.trim(),
                    firstName: widget.motherInfo.firstName,
                    lastName: widget.motherInfo.lastName,
                    password: widget.motherInfo.password,
                    gender: _gender,
                    file: widget.motherInfo.file,
                  );
                  context.read<SignupCubit>().signup(signupInputModel);
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: AppColors.secondaryColor,
              textColor: AppColors.primaryColor,
            ),
          ),
          VerticalSpace(30),
          AnotherWaySign(
            title: AppStrings.orRegisterWith,
          ),
          VerticalSpace(22),
          SocialMediaListItems(),
          VerticalSpace(22),
          Divider(
            color: AppColors.greyColor.withValues(alpha: 0.8),
            height: 1,
            thickness: 1,
          ),
          VerticalSpace(22),
          Center(child: AlreadyHaveAccount()),
          VerticalSpace(22),
        ],
      ),
    );
  }
}
