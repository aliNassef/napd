import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/features/baby/presentation/cubit/get_cubit/get_baby_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../../../../core/widgets/spacers.dart';
import 'baby_profile_image.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/baby_profile_details_view.dart';
import '../widgets/baby_profile_button.dart';

class BabyProfileViewBody extends StatelessWidget {
  const BabyProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBabyCubit, GetBabyState>(
      buildWhen: (_, currentState) {
        return currentState is GetBabyLoaded ||
            currentState is GetBabyFailure ||
            currentState is GetBabyLoading;
      },
      builder: (context, state) {
        if (state is GetBabyFailure) {
          return CustomFailureWidget(
            errMessage: state.errorMessage,
          );
        }

        if (state is GetBabyLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VerticalSpace(40),
                Align(
                  alignment: Alignment.center,
                  child: BabyProfileImage(
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWb6nDWb0rrFUAbs5jed2a9_oO0EczozsKvg&s',
                  ),
                ),
                VerticalSpace(40),
                Text(
                  'Loading...',
                  style: AppStyles.roboto32Bold.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Loading...',
                  style: AppStyles.roboto20Medium.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                VerticalSpace(70),
                BabyProfileButton(
                  onPressed: () {},
                  backgroundColor: AppColors.secondaryColor,
                  icon: AppSvgs.editProfileIcon,
                  text: AppStrings.editProfile,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(.routeName);
                  },
                  backgroundColor: Color(0xffDBF9FF),
                  icon: AppSvgs.addBabyIcon,
                  text: AppStrings.addBaby,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  backgroundColor: Color(0xffF9E9FC),
                  icon: AppSvgs.deleteIcon,
                  text: AppStrings.deleteProfile,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  backgroundColor: Color(0xffBDCAFF),
                  icon: AppSvgs.shareIcon,
                  text: AppStrings.shareProfile,
                ),
              ],
            ).withHorizontalPadding(16),
          );
        }

        if (state is GetBabyLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VerticalSpace(40),
                Align(
                  alignment: Alignment.center,
                  child: BabyProfileImage(
                    image: state.baby.profilePicUrl ?? '',
                  ),
                ),
                VerticalSpace(40),
                Text(
                  state.baby.babyName!,
                  style: AppStyles.roboto32Bold.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  state.baby.birthDate!,
                  style: AppStyles.roboto20Medium.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                VerticalSpace(70),
                BabyProfileButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        BabyProfileDetailsView.routeName,
                        arguments: state.baby);
                  },
                  backgroundColor: AppColors.secondaryColor,
                  icon: AppSvgs.editProfileIcon,
                  text: AppStrings.editProfile,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(.routeName);
                  },
                  backgroundColor: Color(0xffDBF9FF),
                  icon: AppSvgs.addBabyIcon,
                  text: AppStrings.addBaby,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  backgroundColor: Color(0xffF9E9FC),
                  icon: AppSvgs.deleteIcon,
                  text: AppStrings.deleteProfile,
                ),
                VerticalSpace(28),
                BabyProfileButton(
                  backgroundColor: Color(0xffBDCAFF),
                  icon: AppSvgs.shareIcon,
                  text: AppStrings.shareProfile,
                ),
              ],
            ).withHorizontalPadding(16),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
