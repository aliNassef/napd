import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.onLeadingTap});
  final String title;
  final void Function()? onLeadingTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onLeadingTap ??
            () {
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
