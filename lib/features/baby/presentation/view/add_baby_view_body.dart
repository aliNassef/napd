import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/default_app_button.dart';
import '../../../../core/widgets/spacers.dart';

class AddBabyViewBody extends StatelessWidget {
  const AddBabyViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const VerticalSpace(40),
          Text(
            "add your baby".tr(),
            style: AppStyles.roboto48Bold.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          const VerticalSpace(30),
          ClipOval(
            child: Image.asset(
              AppImages.babyHands,
              fit: BoxFit.fill,
            ),
          ),
          const VerticalSpace(100),
          DefaultAppButton(
            text: "add".tr(),
            onPressed: () {},
            backgroundColor: AppColors.secondaryColor,
            textColor: AppColors.primaryColor,
            padding: 48,
          ),
        ],
      ),
    );
  }
}
