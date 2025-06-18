import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../signup/presentation/cubit/sign_up_cubit.dart';
import '../widgets/baby_gender_selector.dart';

class AddBabyView extends StatefulWidget {
  const AddBabyView({super.key});
  static const String routeName = 'addBabyView';

  @override
  State<AddBabyView> createState() => _AddBabyViewState();
}

class _AddBabyViewState extends State<AddBabyView> {
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
    _gender = 0;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              listener: (context, state) {},
              child: DefaultAppButton(
                text: AppStrings.addBaby,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // var addBabyInput = AddBabyInput(
                    //   name: _nameController.text,
                    //   age: _ageController.text,
                    //   gender: _gender,
                    // );
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
            VerticalSpace(22),
          ],
        ),
      ),
    );
  }
}
