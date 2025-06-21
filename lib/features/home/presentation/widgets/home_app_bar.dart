import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:napd/core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_search_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.drawer,
            ),
          ],
        ),
      ),
      titleSpacing: 0,
      title: CustomSearchBar(
        onChanged: onChanged,
      ),
      actions: [
        BlocBuilder<GetMotherProfileCubit, GetMotherProfileState>(
          buildWhen: (previous, current) =>
              current is GetMotherProfileFailure ||
              current is GetMotherProfileLoaded ||
              current is GetMotherProfileLoading,
          builder: (context, state) {
            if (state is GetMotherProfileLoading) {
              return Skeletonizer(
                enabled: true,
                child: CircleAvatar(
                  radius: 22.5.r,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.qbbx_RglyCFRH88Bof6_QwHaHa?rs=1&pid=ImgDetMain',
                  ),
                ),
              );
            } else if (state is GetMotherProfileFailure) {
              return const SizedBox.shrink();
            } else if (state is GetMotherProfileLoaded) {
              return CircleAvatar(
                radius: 22.5.r,
                backgroundImage: NetworkImage(
                  state.profileModel.image,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ).withHorizontalPadding(16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
