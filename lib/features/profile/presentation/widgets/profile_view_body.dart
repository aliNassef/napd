import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/utils/app_colors.dart';
import 'package:napd/core/widgets/custom_failure_widget.dart';
import 'package:napd/core/widgets/default_app_button.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import '../../../login/presentation/view/login_view.dart';
import 'profile_form_style.dart';
import 'profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMotherProfileCubit, GetMotherProfileState>(
      buildWhen: (previous, current) =>
          current is GetMotherProfileLoaded ||
          current is GetMotherProfileFailure ||
          current is GetMotherProfileLoading,
      builder: (context, state) {
        if (state is GetMotherProfileFailure) {
          return CustomFailureWidget(
            errMessage: state.errorMessage,
          );
        }
        if (state is GetMotherProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(24),
                Align(
                  alignment: Alignment.center,
                  child: ProfileImage(
                    image:
                        'https://images.nightcafe.studio/jobs/3Ri6GfFBAhUUHUVG251W/3Ri6GfFBAhUUHUVG251W--1--h7lk0.jpg?tr=w-1600,c-at_max',
                  ),
                ),
                VerticalSpace(24),
                ProfileFormStyle(
                  title: AppStrings.fullName,
                  hintText: 'Loading...',
                ),
                ProfileFormStyle(
                  title: AppStrings.email,
                  hintText: 'Loading...',
                ),
                VerticalSpace(30),
                DefaultAppButton(
                  text: 'Update Profile',
                  backgroundColor: AppColors.darkBlueColor,
                  textColor: Colors.white,
                ),
                VerticalSpace(30),
                DefaultAppButton(
                  text: 'Log out',
                  backgroundColor: AppColors.darkBlueColor,
                  textColor: Colors.white,
                )
              ],
            ),
          );
        }
        if (state is GetMotherProfileLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(24),
              Align(
                alignment: Alignment.center,
                child: ProfileImage(
                  image: state.profileModel.image,
                ),
              ),
              VerticalSpace(24),
              ProfileFormStyle(
                title: AppStrings.fullName,
                hintText: state.profileModel.name,
              ),
              ProfileFormStyle(
                title: AppStrings.email,
                hintText: state.profileModel.email,
              ),
              VerticalSpace(30),
              DefaultAppButton(
                text: AppStrings.updateProfile,
                backgroundColor: AppColors.darkBlueColor,
                textColor: Colors.white,
              ),
              VerticalSpace(15),
              BlocListener<GetMotherProfileCubit, GetMotherProfileState>(
                  listener: (context, state) {
                    if (state is GetMotherProfileLogout) {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamedAndRemoveUntil(
                        LoginView.routeName,
                        (route) => false,
                      );
                    }
                  },
                  child: DefaultAppButton(
                    onPressed: () {
                      context.read<GetMotherProfileCubit>().logout();
                    },
                    text: AppStrings.logout,
                    backgroundColor: AppColors.secondaryColor,
                    textColor: AppColors.darkBlueColor,
                  )),
              VerticalSpace(30),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
