import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/spacers.dart';

class DrawerTopBar extends StatelessWidget {
  const DrawerTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GetMotherProfileCubit, GetMotherProfileState>(
          buildWhen: (previous, current) =>
              current is GetMotherProfileLoaded ||
              current is GetMotherProfileLoading,
          builder: (context, state) {
            if (state is GetMotherProfileLoading) {
              return Skeletonizer(
                enabled: true,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22.5.r,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.qbbx_RglyCFRH88Bof6_QwHaHa?rs=1&pid=ImgDetMain',
                      ),
                    ),
                    HorizantalSpace(20),
                    Text(
                      'Mai Ali',
                      style: AppStyles.roboto20Bold,
                    ),
                    Spacer(),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            if (state is GetMotherProfileLoaded) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22.5.r,
                    backgroundImage: NetworkImage(
                      state.profileModel.image,
                    ),
                  ),
                  HorizantalSpace(20),
                  Text(
                    state.profileModel.name,
                    style: AppStyles.roboto20Bold,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        TextButton.icon(
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(15),
            alignment: Alignment.center,
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(
              AppColors.secondaryColor,
            ),
          ),
          onPressed: () {},
          label: Text(
            AppStrings.addNewBaby,
            style: AppStyles.roboto14Regular.copyWith(
              color: Colors.white,
            ),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 15,
          ),
        ),
      ],
    ).withHorizontalPadding(16);
  }
}
