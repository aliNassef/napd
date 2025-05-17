import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/image_picker_helper.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/model/signup_input_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../view/create_baby_account_view.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_check_box.dart';

class MotherAccountForm extends StatefulWidget {
  const MotherAccountForm({super.key});

  @override
  State<MotherAccountForm> createState() => _MotherAccountFormState();
}

class _MotherAccountFormState extends State<MotherAccountForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AutovalidateMode _autovalidateMode;
  late bool remember;
  File? imageFile;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    remember = false;
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  ImagePickerHelper.openGallery(
                    onGet: (img) {
                      setState(() {
                        imageFile = img;
                      });
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xffEAE8E8),
                  backgroundImage:
                      imageFile == null ? null : FileImage(imageFile!),
                  child: imageFile == null
                      ? SvgPicture.asset(AppSvgs.uploadImageIcon)
                      : null,
                ),
              ),
              HorizantalSpace(20),
              Text(
                AppStrings.uploadProfilePhoto,
                style: AppStyles.roboto20SemiBold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
          VerticalSpace(28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: AppStrings.firstName,
                  controller: _firstNameController,
                ),
              ),
              HorizantalSpace(50),
              Expanded(
                child: CustomTextFormField(
                  hintText: AppStrings.lastName,
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          VerticalSpace(28),
          CustomTextFormField(
            hintText: AppStrings.email,
            controller: _emailController,
          ),
          VerticalSpace(28),
          CustomTextFormField(
            isPassword: true,
            hintText: AppStrings.password,
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
                AppStrings.rememberMe,
                style: AppStyles.roboto20Regular.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          VerticalSpace(22),
          DefaultAppButton(
            onPressed: () => _checkSignUpButtonValidity(context),
            text: AppStrings.addYourBaby,
            backgroundColor: Colors.white,
            textColor: AppColors.darkBlueColor,
          ),
        ],
      ),
    );
  }

  void _checkSignUpButtonValidity(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var motherInfo = SignupInputModel(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        file: imageFile,
      );
      Navigator.pushNamed(
        context,
        CreateBabyAccountView.routeName,
        arguments: motherInfo,
      );
    } else {
      _autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
