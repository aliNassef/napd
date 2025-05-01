import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import 'package:napd/features/baby/data/models/baby_model.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';
import 'baby_info_row.dart';

class BabyInfoContent extends StatelessWidget {
  const BabyInfoContent({
    super.key,
    required this.babyModel,
  });
  final BabyModel babyModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(top: 107),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              babyModel.babyName!,
              style: AppStyles.roboto36Bold.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            VerticalSpace(2),
            Text(
              calculateAge(babyModel.birthDate!),
              style: AppStyles.roboto20Medium.copyWith(
                color: AppColors.greenLightColor,
              ),
            ),
            VerticalSpace(45),
            BabyInfoRow(
              title: AppStrings.gender,
              value: babyModel.gender == 0 ? 'Girl' : 'Boy',
            ),
            VerticalSpace(7),
            Divider(
              color: Color(0xffEAE8E8),
            ),
            VerticalSpace(7),
            BabyInfoRow(
              title: AppStrings.birthDate,
              value: babyModel.birthDate!,
            ),
            VerticalSpace(7),
            Divider(
              color: Color(0xffEAE8E8),
            ),
          ],
        ).withHorizontalPadding(16),
      ),
    );
  }

  String calculateAge(String birthDate) {
    final birth = DateTime.parse(birthDate);
    final now = DateTime.now();

    int years = now.year - birth.year;
    int months = now.month - birth.month;

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    if (years > 0) {
      return '$years years, $months months';
    } else {
      return '$months months';
    }
  }
}
