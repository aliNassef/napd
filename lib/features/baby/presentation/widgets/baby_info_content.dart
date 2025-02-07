

import 'package:flutter/material.dart';
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
  });

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
              'Karma Ahmed ',
              style: AppStyles.roboto36Bold.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
            VerticalSpace(2),
            Text(
              '5 months',
              style: AppStyles.roboto20Medium.copyWith(
                color: AppColors.greenLightColor,
              ),
            ),
            VerticalSpace(45),
            BabyInfoRow(
              title: 'Gender',
              value: 'Female',
            ),
            VerticalSpace(7),
            Divider(
              color: Color(0xffEAE8E8),
            ),
            VerticalSpace(7),
            BabyInfoRow(
              title: 'Birth date',
              value: '22/8/2024',
            ),
            VerticalSpace(7),
            Divider(
              color: Color(0xffEAE8E8),
            ),
            VerticalSpace(7),
            BabyInfoRow(
              title: 'Weight',
              value: '6.7 kg',
            ),
            VerticalSpace(7),
            Divider(
              color: Color(0xffEAE8E8),
            ),
            VerticalSpace(7),
            BabyInfoRow(
              title: 'Height',
              value: '64 cm',
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
}

