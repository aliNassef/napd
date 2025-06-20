import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:napd/core/functions/show_error_message.dart';
import 'package:napd/core/functions/show_loading_box.dart';
import 'package:napd/core/functions/toast_dialog.dart';
import 'package:napd/core/widgets/background_widget.dart';
import 'package:napd/features/baby/data/models/add_baby_input_model.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../cubit/add_baby_cubit/add_baby_cubit.dart';
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
  late XFile image;
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
    return BlocProvider(
      create: (context) => injector<AddBabyCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BackgroundWidget(
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                        
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xffEAE8E8),
                          backgroundImage: FileImage(File(image.path)),
                          child: SvgPicture.asset(AppSvgs.uploadImageIcon),
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
                  BlocListener<AddBabyCubit, AddBabyState>(
                    listener: (context, state) {
                      if (state is AddBabyLoaded) {
                        showToast(text: 'Baby Added Successfully');
                      }
                      if (state is AddBabyFailure) {
                        showErrorMessage(context, errMessage: state.errMessage);
                      }
                      if (state is AddBabyLoading) {
                        showLoadingBox(context);
                      }
                    },
                    child: DefaultAppButton(
                      text: AppStrings.addBaby,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var addBabyInput = AddBabyInputModel(
                            name: _nameController.text,
                            age: _ageController.text,
                            gender: _gender,
                            image: image,
                          );
                          context.read<AddBabyCubit>().addBaby(addBabyInput);
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
          ),
        );
      }),
    );
  }
}
