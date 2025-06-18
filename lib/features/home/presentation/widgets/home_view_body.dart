import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/helpers/image_picker_helper.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import 'package:napd/features/home/presentation/widgets/baby_info_bloc_builder.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/functions/show_error_message.dart';
import '../../../../core/functions/toast_dialog.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/gallrey_cubit/gallrey_cubit.dart';
import 'chat_bot_section.dart';

import 'home_features.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpace(10),
          BabyInfoBlocBuilder(),
          VerticalSpace(40),
          HomeFeatures(),
          VerticalSpace(30),
          ChatBotSection().withHorizontalPadding(16),
          VerticalSpace(30),
          Row(
            children: [
              Text(
                AppStrings.captureYourMoments,
                style: AppStyles.roboto24SemiBold.copyWith(
                  color: AppColors.darkBlueColor,
                ),
              ),
              HorizantalSpace(23),
              BlocListener<GallreyCubit, GallreyState>(
                listener: (context, state) {
                  if (state is AddImageToGallreyStateFailure) {
                    showErrorMessage(context, errMessage: state.errMessage);
                  }
                  if (state is AddImageToGallreyStateLoaded) {
                    showToast(text: 'Image added successfully');
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    ImagePickerHelper.openImagePicker(
                      onGet: (img) {
                        var input =
                            GallreyInputModel(description: '', imgae: img);
                        context
                            .read<GallreyCubit>()
                            .uploadImageToGallrey(input);
                      },
                      context: context,
                    );
                  },
                  child: Image.asset(
                    AppImages.camera,
                  ),
                ),
              ),
            ],
          ).withHorizontalPadding(16),
          VerticalSpace(22),
          Image.asset(
            AppImages.captureYourMoments,
            width: context.width,
            height: context.height * 2 / 5,
            fit: BoxFit.cover,
          ).withHorizontalPadding(16),
          VerticalSpace(40),
        ],
      ),
    );
  }
}
