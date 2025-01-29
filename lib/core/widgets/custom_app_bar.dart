import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_search_bar.dart';
import '../utils/app_images.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomSearchAppBar({
    super.key,
    this.hasLeading = false,
    this.leading,
  });

  final bool hasLeading;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: leading != null
          ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [leading!],
          )
          : GestureDetector(
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
      title: leading != null
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomSearchBar(),
            )
          : CustomSearchBar(),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: CircleAvatar(
            radius: 22.5.r,
            backgroundImage: AssetImage(
              AppImages.dummyGirl,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 30.r,
          ),
        ),
      ),
      title: Text(
        title,
        style: AppStyles.roboto26Bold.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
