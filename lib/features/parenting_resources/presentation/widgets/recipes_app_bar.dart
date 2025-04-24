import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RecipeTipsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeTipsAppBar({super.key});

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
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: 24.r,
        ).withHorizontalPadding(20),
      ),
      title: Text(
        AppStrings.recipes,
        style: AppStyles.roboto26Bold.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
