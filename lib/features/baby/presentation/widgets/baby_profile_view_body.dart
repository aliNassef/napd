import 'package:flutter/material.dart';
import 'package:napd/core/extensions/padding_extension.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/utils/app_images.dart';
import 'package:napd/core/widgets/spacers.dart';
import 'package:napd/features/baby/presentation/widgets/baby_profile_image.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../add_baby/presentation/view/add_baby_page.dart';
import '../view/baby_profile_details_view.dart';
import '../widgets/baby_profile_button.dart';

class BabyProfileViewBody extends StatelessWidget {
  const BabyProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalSpace(40),
          Align(
            alignment: Alignment.center,
            child: BabyProfileImage(),
          ),
          VerticalSpace(40),
          Text(
            'Karma Ahmed',
            style: AppStyles.roboto32Bold.copyWith(
              color: AppColors.darkBlueColor,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '5 months',
            style: AppStyles.roboto20Medium.copyWith(
              color: AppColors.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          VerticalSpace(70),
          BabyProfileButton(
            onPressed: () {
              Navigator.of(context).pushNamed(BabyProfileDetailsView.routeName);
            },
            backgroundColor: AppColors.secondaryColor,
            icon: AppSvgs.editProfileIcon,
            text: 'Edit Profile',
          ),
          VerticalSpace(28),
          BabyProfileButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddBabyPage.routeName);
            },
            backgroundColor: Color(0xffDBF9FF),
            icon: AppSvgs.addBabyIcon,
            text: 'Add Baby',
          ),
          VerticalSpace(28),
          BabyProfileButton(
            backgroundColor: Color(0xffF9E9FC),
            icon: AppSvgs.deleteIcon,
            text: 'Delete Baby',
          ),
          VerticalSpace(28),
          BabyProfileButton(
            backgroundColor: Color(0xffBDCAFF),
            icon: AppSvgs.shareIcon,
            text: 'Share Profile',
          ),
        ],
      ).withHorizontalPadding(16),
    );
  }
}
