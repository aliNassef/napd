import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/functions/get_user.dart';
import 'package:napd/core/helpers/image_picker_helper.dart';
import 'package:napd/features/home/data/model/gallrey_input_model.dart';
import '../../../../core/extensions/padding_extension.dart';
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
          Text(
            getBaby()?.babyName! ?? '',
            style: AppStyles.roboto24SemiBold.copyWith(
              color: AppColors.darkBlueColor,
            ),
          ).withHorizontalPadding(16),
          VerticalSpace(6),
          Text(
            calculateAgeDifference(getBaby()?.birthDate ?? ''),
            style: AppStyles.roboto16Regular.copyWith(
              color: AppColors.greenLightColor,
            ),
          ).withHorizontalPadding(16),
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
              GestureDetector(
                onTap: () {
                  ImagePickerHelper.openImagePicker(
                    onGet: (img) {
                      var input =
                          GallreyInputModel(description: '', imgae: img);
                      context.read<GallreyCubit>().uploadImageToGallrey(input);
                    },
                    context: context,
                  );
                },
                child: Image.asset(
                  AppImages.camera,
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

  String calculateAgeDifference(String targetDate) {
    if (targetDate.isEmpty) {
      return '';
    }
    // Parse the target date
    final target = DateTime.parse(targetDate.split('/').reversed.join('-'));
    final now = DateTime.now();

    // Calculate the difference in years and months
    int years = now.year - target.year;
    int months = now.month - target.month;

    // Adjust if the current month is earlier than the target month
    if (months < 0) {
      years -= 1;
      months += 12;
    }
    return tr(
      'age_difference',
      namedArgs: {
        'years': years.toString(),
        'months': months.toString(),
      },
    );
  }
}
