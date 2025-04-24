import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_search_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

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
      title: CustomSearchBar(),
      actions: [
        CircleAvatar(
          radius: 22.5.r,
          backgroundImage: AssetImage(
            AppImages.dummyGirl,
          ),
        ).withHorizontalPadding(16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
